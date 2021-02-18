defmodule MyAwesomeAppWeb.Pages.TableLive.Index do
  use MyAwesomeAppWeb, :live_view
  alias MyAwesomeApp.Claims

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def handle_params(params, _url, socket) do
    page = String.to_integer(params["page"] || "1")
    per_page = String.to_integer(params["per_page"] || "10")
    sort_by = (params["sort_by"] || "billed_amount") |> String.to_atom()
    sort_order = (params["sort_order"] || "desc") |> String.to_atom()

    paginate_options = %{page: page, per_page: per_page}
    sort_options = %{sort_by: sort_by, sort_order: sort_order}

    claims = Claims.list_claims(paginate: paginate_options, sort: sort_options)

    socket =
      assign(socket,
        modal_open: false,
        options: Map.merge(paginate_options, sort_options),
        claims: claims,
        columns: columns()
      )

    {:noreply, socket}
  end

  def handle_event("select-per-page", %{"per-page" => per_page}, socket) do
    per_page = String.to_integer(per_page)

    socket =
      push_patch(socket,
        to:
          Routes.table_index_path(
            socket,
            :index,
            page: socket.assigns.options.page,
            per_page: per_page,
            sort_by: socket.assigns.options.sort_by,
            sort_order: socket.assigns.options.sort_order
          )
      )

    {:noreply, socket}
  end

  def handle_event("select-per-page-test", %{"per-page" => per_page}, socket) do
    per_page = String.to_integer(per_page)

    socket =
      push_patch(socket,
        to:
          Routes.table_index_path(
            socket,
            :index,
            page: socket.assigns.options.page,
            per_page: per_page,
            sort_by: socket.assigns.options.sort_by,
            sort_order: socket.assigns.options.sort_order
          )
      )

    {:noreply, socket}
  end

  def handle_event("open-modal", _params, socket) do
    socket = assign(socket, modal_open: true)
    {:noreply, socket}
  end

  def handle_event("close-modal", _params, socket) do
    socket = assign(socket, modal_open: false)
    {:noreply, socket}
  end

  defp columns() do
    [
      %{label: "Claim", value: "claim", type: "number"},
      %{label: "Claim Type", value: "claim_type", type: "text"},
      %{label: "Provider", value: "provider", type: "text"},
      %{label: "Provider Location", value: "provider_location", type: "text"},
      %{label: "Billed Amount", value: "billed_amount", type: "money"},
      %{label: "Discount", value: "discount", type: "money"},
      %{label: "% Discount", value: "pct_discount", type: "float"},
      %{label: "Paid Date", value: "paid_date", type: "date"},
      %{label: "Days To Pay", value: "days_to_pay", type: "number"}
    ]
  end
end
