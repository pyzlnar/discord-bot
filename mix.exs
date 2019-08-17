defmodule Bot.MixProject do
  use Mix.Project

  def project do
    [
      app:             :rem,
      version:         "0.1.0",
      elixir:          "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps:            deps(),
      aliases:         aliases()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod:                {Rem, []},
      extra_applications: [:logger]
    ]
  end

  defp aliases do
    [
      test: "test --no-start"
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      { :alchemy,     "~> 0.6.4", hex:  :discord_alchemy     },
      { :credo,       "~> 1.0.0", only: :dev, runtime: false },
      { :mimic,       "1.0.0",    only: :test                },
      { :yaml_elixir, "~> 2.4"                               }
    ]
  end
end
