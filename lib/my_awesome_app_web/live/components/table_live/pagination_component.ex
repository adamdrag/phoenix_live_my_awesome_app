defmodule MyAwesomeAppWeb.Components.TableLive.PaginationComponent do
  use MyAwesomeAppWeb, :live_component
  alias MyAwesomeApp.Claims

  def mount(socket) do
    all_claims = Claims.list_claims()

    socket =
      assign(socket,
        claims_number: length(all_claims)
      )

    {:ok, socket}
  end

  def update(assigns, socket) do
    socket = assign(socket, assigns)

    %{assigns: %{claims_number: claims_number, options: options}} = socket

    socket =
      assign(socket,
        max_number_of_pages: Integer.floor_div(claims_number, options.per_page)
      )

    {:ok, socket}
  end

  defp pagination_link(socket, text, page, per_page, options, class) do
    live_patch(text,
      to:
        Routes.table_index_path(
          socket,
          :index,
          page: page,
          per_page: per_page,
          sort_by: options.sort_by,
          sort_order: options.sort_order
        ),
      class: class
    )
  end
end
