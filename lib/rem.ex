defmodule Rem do
  use Application
  alias Alchemy.Client

  def start(_type, _args) do
    run = Client.start(Rem.Secrets.get(["discord", "token"]))
    use Rem.Commands
    run
  end
end
