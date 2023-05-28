defmodule LexiWeb.ChatController do
  use LexiWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end
end
