defmodule Rem.Commands do
  use Alchemy.Cogs

  Cogs.def hi do
    username = get_username(Cogs.member())
    Cogs.say "Hello, #{username}!"
  end

  Cogs.def help do
    prefix = Rem.get_config(:prefix)
    Cogs.say """
    Im at your service `WIP: Currently under development!`
    **Orders**:
    ```
    #{prefix}help   I'll respond with this message
    #{prefix}hi     I'll say hi
    #{prefix}ping   I'll ping you back if I'm still alive
    #{prefix}repeat I'll repeat what you said
    #{prefix}repo   I'll give you the link to my repository
    #{prefix}thanks No need to thank me...
    ```
    """
  end

  Cogs.def ping do
    Cogs.say "Still alive!"
  end

  Cogs.def thanks do
    Cogs.say "It is my pleasure."
  end

  Cogs.set_parser(:repeat, &List.wrap/1)
  Cogs.def repeat(rest) do
    Cogs.say(rest)
  end

  Cogs.def repo do
    Cogs.say "https://github.com/pyzlnar/discord-bot"
  end

  # TODO Learn scopes
  # Can't use Cogs here directly
  def get_username(response) do
    case response do
      { :ok, member } -> member.user.username
      _else           -> "INCOGNITO"
    end
  end
end
