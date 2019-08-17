defmodule Rem.Commands do
  @moduledoc "Contains the definitions for Rem commands"
  alias Alchemy.{Message, User}
  use Alchemy.Cogs
  import Rem.Gettext


  Cogs.def hi do
    %Message{author: %User{username: username}} = message
    Cogs.say gettext("orders.hi", username: username)
  end

  Cogs.def help do
    Cogs.say gettext("orders.help", prefix: Rem.get_config(:prefix))
  end

  Cogs.def ping do
    Cogs.say gettext("orders.ping")
  end

  Cogs.def repo do
    Cogs.say gettext("orders.repo")
  end

  Cogs.set_parser(:say, &List.wrap/1)
  Cogs.def say(rest) do
    %Alchemy.Message{author: %Alchemy.User{bot: bot}} = message
    unless bot, do: Cogs.say(rest)
  end

  Cogs.def thanks do
    Cogs.say gettext("orders.thanks")
  end
end
