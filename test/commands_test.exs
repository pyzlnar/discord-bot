defmodule Rem.CommandsTest do
  alias Rem.Commands
  alias Alchemy.{Client, Message, User}
  import Rem.Gettext
  import Mimic
  use ExUnit.Case

  def send_message(_msg, txt), do: txt
  def message, do: %Message{channel_id: :channel_id}

  describe "Rem.Commands.hi/1" do
    test "it replies with the username" do
      message = %Message{message() | author: %User{username: :username}}
      expect(Client, :send_message, &send_message/2)

      assert Commands.hi(message) == gettext("orders.hi", username: :username)
    end
  end

  describe "Rem.Commands.help/1" do
    test "it replies with the help menu" do
      expect(Client, :send_message, &send_message/2)

      assert Commands.help(message()) == gettext("orders.help", prefix: Rem.get_config(:prefix))
    end
  end

  describe "Rem.Commands.ping/1" do
    test "it replies with a ping message" do
      expect(Client, :send_message, &send_message/2)

      assert Commands.ping(message()) == gettext("orders.ping")
    end
  end

  describe "Rem.Commands.repo/1" do
    test "it replies with the repository link" do
      expect(Client, :send_message, &send_message/2)

      assert Commands.repo(message()) == gettext("orders.repo")
    end
  end

  describe "Rem.Commands.say/2" do
    test "it replies with the recieved message if not bot user" do
      message = %Message{message() | author: %User{bot: false}}
      text    = "I am a taco"
      expect(Client, :send_message, &send_message/2)

      assert Commands.say(message, text) == text
    end

    test "it replies nothing if bot user" do
      message = %Message{message() | author: %User{bot: true}}
      reject(&Client.send_message/2)

      assert Commands.say(message, "I am a taco") == nil
    end
  end

  describe "Rem.Commands.thanks/1" do
    test "it replies with a grateful message" do
      expect(Client, :send_message, &send_message/2)

      assert Commands.thanks(message()) == gettext("orders.thanks")
    end
  end
end
