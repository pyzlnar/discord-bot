defmodule Rem.Commands do
  use Alchemy.Cogs

  Cogs.def ping do
    Cogs.say "pong!"
  end

  Cogs.def help do
    Cogs.say """
      WIP: Currently under development!
      Commands:
      !help Shows this menu
      !ping Tests if im still alive
    """
  end
end
