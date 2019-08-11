defmodule Rem do
  use Application
  alias Alchemy.Client

  def start(_type, _args) do
    run = Client.start(Rem.Config.get!(:token))
    Alchemy.Cogs.set_prefix(Rem.Config.get!(:prefix))
    use Rem.Commands
    run
  end
end
