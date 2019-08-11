# Wrapper for config
# TODO Maybe create a struct here? Im still learning yo
defmodule Rem.Config do
  def get(config) do
    Application.fetch_env(:rem, config)
  end

  def get!(config) do
    case get(config) do
      { :ok, result } -> result
      other           -> other
    end
  end
end
