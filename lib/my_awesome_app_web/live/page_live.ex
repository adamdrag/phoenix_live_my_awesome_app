defmodule MyAwesomeAppWeb.PageLive do
  use MyAwesomeAppWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, text: "Hello")}
  end
end
