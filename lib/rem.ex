defmodule Rem do
  use Application
  alias Alchemy.Client

  def start(_type, _args) do
    run = Client.start(Application.fetch_env!(:rem, :token))
    use Rem.Commands
    run
  end
end
