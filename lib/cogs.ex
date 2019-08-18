defmodule Rem.Cogs do
  @moduledoc "This module contains the cogs definitions"
  alias Rem.Commands
  use Alchemy.Cogs

  Cogs.def hi do
    Commands.hi(message)
  end

  Cogs.def help do
    Commands.help(message)
  end

  Cogs.def ping do
    Commands.ping(message)
  end

  Cogs.def repo do
    Commands.repo(message)
  end

  Cogs.set_parser(:say, &List.wrap/1)
  Cogs.def say(rest) do
    Commands.say(message, rest)
  end

  Cogs.def thanks do
    Commands.thanks(message)
  end
end
