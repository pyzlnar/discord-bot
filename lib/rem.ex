defmodule Rem do
  @moduledoc "Top level module that starts the Rem bot."
  use Application
  alias Alchemy.Client

  def start(_type, _args) do
    run = Client.start(Rem.get_config(:token))
    if Rem.get_config(:load_commands), do: Rem.load_commands()
    run
  end

  def get_config(which), do: Application.get_env(:rem, which)

  def load_commands do
    Alchemy.Cogs.set_prefix(Rem.get_config(:prefix))
    use Rem.Cogs
  end
end
