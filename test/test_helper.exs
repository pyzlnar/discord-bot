Application.ensure_all_started(:mimic)

Mimic.copy(Alchemy.Client)
Mimic.copy(Alchemy.Cogs)
Mimic.copy(Rem)
Mimic.copy(Rem.Commands)

defmodule Test.Fns do
  def f,      do: :f0
  def f(arg), do: arg

  def falsy,     do: false
  def truthy,    do: true
  def falsy(_),  do: false
  def truthy(_), do: true
end

ExUnit.start()
