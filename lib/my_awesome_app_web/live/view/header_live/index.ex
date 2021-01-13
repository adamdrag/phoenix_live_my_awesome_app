defmodule MyAwesomeAppWeb.View.HeaderLive.Index do
  use MyAwesomeAppWeb, :live_view

  def mount(_params, session, socket) do
    %{"current_user" => current_user} = session

    socket =
      assign(socket,
        current_user: current_user,
        hamburger_icon: "block",
        toggle_hamburger_menu: "hidden",
        toggle_user_menu: "hidden"
      )

    {:ok, socket}
  end

  def handle_event("toggle-hamburger-menu", _, socket) do
    socket =
      socket
      |> update(:toggle_hamburger_menu, &if(&1 == "hidden", do: "block", else: "hidden"))
      |> update(:hamburger_icon, &if(&1 == "block", do: "hidden", else: "block"))

    {:noreply, socket}
  end

  def handle_event("toggle-user-menu", _, socket) do
    socket = update(socket, :toggle_user_menu, &if(&1 == "hidden", do: "block", else: "hidden"))
    {:noreply, socket}
  end
end
