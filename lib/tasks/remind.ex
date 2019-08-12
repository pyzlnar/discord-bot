defmodule Mix.Tasks.Remind do
  use Mix.Task

  @shortdoc "Says something in a channel"

  def run([reminder]) do
    Application.ensure_all_started(:rem)

    { guild_name, channel_name, message } =
      get_reminders()
      |> find_reminder(reminder)

    find_guilds()
    |> find_guild(guild_name)
    |> find_channels
    |> find_channel(channel_name)
    |> send_message(message)
  end

  defp get_reminders do
    case YamlElixir.read_from_file(Path.join(File.cwd!(), "config/reminders.yml")) do
      { :ok, reminders } -> reminders
      _else              -> raise "Reminders file not found. Are you running in the project root?"
    end
  end

  # TODO See if you can improve
  defp find_reminder(reminders, reminder) do
    default = Map.get(reminders, "_defaults") || %{}
    current = Map.get(reminders, reminder)    || %{}
    %{ "server" => guild_name, "channel" => channel_name, "message" => message } = Map.merge(default, current)

    # This is not super efficient as it tries to replace for all your replacements
    # Im tired, I just wanted this one done... Ill fix when I do tests
    message =
      Rem.get_config(:reminders)
      |> Enum.reduce(message, fn { regex, replacement }, s -> String.replace(s, regex, replacement) end)

    { guild_name, channel_name, message }
  end

  defp find_guilds do
    case Alchemy.Client.get_current_guilds do
      { :ok, guilds } -> guilds
      _else           -> raise "Guilds not found"
    end
  end

  defp find_guild(guilds, name) do
    case Enum.find(guilds, fn guild -> guild.name == name end) do
      %Alchemy.UserGuild{id: id} -> id
      nil                        -> raise "Guild '#{name}' not found"
    end
  end

  defp find_channels(guild_id) do
    case Alchemy.Client.get_channels(guild_id) do
      { :ok, channels } -> channels
      _else             -> raise "Channels not found"
    end
  end

  defp find_channel(channels, name) do
    case Enum.find(channels, fn channel -> channel.name == name end) do
      %Alchemy.Channel.TextChannel{id: id} -> id
      nil                                  -> raise "Channel '#{name}' not found"
    end
  end

  defp send_message(channel_id, message) do
    Alchemy.Client.send_message(channel_id, message)
  end
end
