defmodule Rem.Commands do
  @moduledoc "Contains the body of Rem's orders"
  alias Alchemy.{Client, Message, User}
  import Rem.Gettext

  def hi(message) do
    %Message{author: %User{username: username}} = message
    reply message, gettext("orders.hi", username: username)
  end

  def help(message) do
    reply message, gettext("orders.help", prefix: Rem.get_config(:prefix))
  end

  def ping(message) do
    reply message, gettext("orders.ping")
  end

  def repo(message) do
    reply message, gettext("orders.repo")
  end

  def say(message, text) do
    %Message{author: %User{bot: bot}} = message
    unless bot, do: reply(message, text)
  end

  def thanks(message) do
    reply message, gettext("orders.thanks")
  end

  defp reply(%Message{channel_id: channel_id}, body) do
    Client.send_message(channel_id, body)
  end
end
