defmodule MyAwesomeAppWeb.Pages.TrelloCloneLive.Index do
  use MyAwesomeAppWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
