defmodule Rem.Commands do
  alias Alchemy.{Message, User}
  use Alchemy.Cogs

  @moduledoc """
  Contains the definitions for Rem commands
  """

  Cogs.def hi do
    %Message{author: %User{username: username}} = message
    Cogs.say "Hello, #{username}!"
  end

  Cogs.def help do
    prefix = Rem.get_config(:prefix)
    Cogs.say """
    I'm at your service `WIP: Currently under development!`
    **Orders**:
    ```
    #{prefix}help   I'll respond with this message
    #{prefix}hi     I'll say hi
    #{prefix}ping   I'll ping you back if I'm still alive
    #{prefix}repo   I'll give you the link to my repository
    #{prefix}say    I'll repeat what you said
    #{prefix}thanks No need to thank me...
    ```
    """
  end

  Cogs.def ping do
    Cogs.say "Still alive!"
  end

  Cogs.def repo do
    Cogs.say "https://github.com/pyzlnar/discord-bot"
  end

  Cogs.set_parser(:say, &List.wrap/1)
  Cogs.def say(rest) do
    Cogs.say(rest)
  end

  Cogs.def thanks do
    Cogs.say "It is my pleasure."
  end
end
