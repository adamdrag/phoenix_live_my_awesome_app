defmodule MyAwesomeAppWeb.Pages.AlpineExamplesLive.Index do
  use MyAwesomeAppWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end

# LiveView renders twice. First when the server renders the page and the second time when the LiveView web socket connects to the server.
# When that happens, Alpine loses track of the DOM element.
