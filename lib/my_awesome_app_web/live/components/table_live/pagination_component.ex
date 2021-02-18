defmodule MyAwesomeAppWeb.Components.TableLive.PaginationComponent do
  use MyAwesomeAppWeb, :live_component

  def mount(socket) do
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
