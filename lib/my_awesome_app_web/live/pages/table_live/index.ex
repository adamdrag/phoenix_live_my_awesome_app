defmodule MyAwesomeAppWeb.Pages.TableLive.Index do
  use MyAwesomeAppWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :number, 10)}
  end
end
