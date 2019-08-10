defmodule Rem.Commands do
  use Alchemy.Cogs

  Cogs.def ping do
    Cogs.say "pong!"
  end
end
