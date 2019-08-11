import Config

config :porcelain,
  driver: Porcelain.Driver.Basic

config :rem,
  prefix: "Rem, "

import_config "secrets.exs"
