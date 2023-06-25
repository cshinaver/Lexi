defmodule LexiWeb.RoomChannel do
  use Phoenix.Channel
  require Logger

  def join("room:lobby", _message, socket) do
    {:ok, socket}
  end

  def join("room:" <> _private_room_id, _params, socket) do
    send(self, :after_join)
    {:ok, socket}
  end

  def handle_info(:after_join, socket) do
    message = "Welcome to your private tutor session for Mandarin!"
    broadcast!(socket, "new_msg", %{body: message})
    {:noreply, socket}
  end

  def handle_in("new_msg", %{"body" => body}, socket) do
    broadcast!(socket, "new_msg", %{body: body})
    {:noreply, socket}
  end
end
