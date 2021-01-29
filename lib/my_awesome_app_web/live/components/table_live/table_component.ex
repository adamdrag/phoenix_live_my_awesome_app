defmodule MyAwesomeAppWeb.Components.TableLive.TableComponent do
  use MyAwesomeAppWeb, :live_component

  def mount(socket) do
    {:ok, socket}
  end

  defp sort_link(socket, text, sort_by, options) do
    text =
      if sort_by == options.sort_by do
        text <> icon(options.sort_order)
      else
        text
      end

    live_patch(text,
      to:
        Routes.table_index_path(
          socket,
          :index,
          page: options.page,
          per_page: options.per_page,
          sort_by: sort_by,
          sort_order: toggle_sort_order(options.sort_order)
        )
    )
  end

  defp toggle_sort_order(:asc), do: :desc
  defp toggle_sort_order(:desc), do: :asc

  defp icon(:asc), do: "↓"
  defp icon(:desc), do: "↑"
end
