defmodule MyAwesomeAppWeb.Components.PageTitleLive do
  use MyAwesomeAppWeb, :live_component

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
      <div class="text-2xl tracking-widest text-gray-800 uppercase border-b-2 border-gray-800 pt-2 pb-4 my-4">
        <%= @title %>
      </div>
    """
  end
end
