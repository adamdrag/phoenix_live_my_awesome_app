defmodule MyAwesomeAppWeb.View.FooterLive.Index do
  use MyAwesomeAppWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <footer class="py-4 mt-auto text-gray-600 bg-gray-800 footer">
        <div class="container max-w-6xl mx-auto">
            <%= link "myawesomeapp", to: "/", class: "text-muted px-2 hover:text-white" %>
        </div>
    </footer>
    """
  end
end
