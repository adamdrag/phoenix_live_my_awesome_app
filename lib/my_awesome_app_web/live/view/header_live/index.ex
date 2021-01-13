defmodule MyAwesomeAppWeb.View.HeaderLive.Index do
  # use Phoenix.LiveComponent
  use MyAwesomeAppWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, number: 5)}
  end
end
