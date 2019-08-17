defmodule Bot.MixProject do
  use Mix.Project

  def project do
    [
      aliases:         aliases(),
      app:             :rem,
      compilers:       compilers(),
      deps:            deps(),
      elixir:          "~> 1.9",
      start_permanent: Mix.env() == :prod,
      version:         "0.1.0",
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

  defp compilers do
    [:gettext] ++ Mix.compilers()
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:alchemy,     "~> 0.6.4", hex:  :discord_alchemy    },
      {:credo,       "~> 1.0.0", only: :dev, runtime: false},
      {:gettext,     ">= 0.0.0"                            },
      {:mimic,       "1.0.0",    only: :test               },
      {:yaml_elixir, "~> 2.4"                              }
    ]
  end
end
