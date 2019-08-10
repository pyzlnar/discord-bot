defmodule Rem.Secrets do
  @path Path.join(File.cwd!(), 'config/secrets.yml')
  {:ok, secrets} = YamlElixir.read_from_file(@path)
  @secrets secrets

  def get do
    @secrets
  end

  def get(keys) do
    Kernel.get_in(@secrets, keys)
  end
end
