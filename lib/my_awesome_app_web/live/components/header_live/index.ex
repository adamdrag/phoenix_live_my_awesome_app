defmodule MyAwesomeAppWeb.Components.HeaderLive.Index do
  use MyAwesomeAppWeb, :live_view

  def mount(_params, session, socket) do
    %{"current_user" => current_user} = session

    socket =
      assign(socket,
        current_user: current_user,
        toggle_mobile_view_menu_dropdown_opened?: false
      )

    {:ok, socket}
  end

  def handle_event("toggle-mobile-view-hamburger-menu", _, socket) do
    socket =
      socket
      |> update(
        :toggle_mobile_view_menu_dropdown_opened?,
        &if(&1 == false, do: true, else: false)
      )

    {:noreply, socket}
  end
end
