defmodule RemTest do
  use ExUnit.Case
  use Mimic
  alias Test.Fns

  describe "Rem.start/2" do
    test "it loads the client and sets the commands" do
      Alchemy.Client
      |> expect(:start, &Fns.f/1)

      Rem
      |> stub(:get_config,      &Fns.f/1)
      |> expect(:load_commands, &Fns.f/0)

      assert Rem.start(:type, :args) == :token
    end

    test "it loads the client but does not load the commands" do
      Alchemy.Client
      |> expect(:start, &Fns.f/1)

      Rem
      |> stub(:get_config, &Fns.falsy/1)
      reject(&Rem.load_commands/0)

      assert Rem.start(:type, :args) == false
    end
  end

  describe "Rem.get_config/1" do
    test "it retrieves the rem configs" do
      Application.put_env(:rem, :config_key, :config_value)
      assert Rem.get_config(:config_key) == :config_value
    end
  end
end
