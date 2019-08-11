import Config

config :porcelain,
  driver: Porcelain.Driver.Basic

config :rem,
  prefix:        "Rem, ",
  load_commands: System.get_env("REM_LOAD_COMMANDS") == "true"

import_config "secrets.exs"
