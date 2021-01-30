defmodule MyAwesomeAppWeb.Components.Form.SelectLive do
  use MyAwesomeAppWeb, :live_component

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <div
        id="<%= if connected?(@socket), do: 'connected-select', else: 'not-connected-select' %>"
        x-data="{ open_select_menu: false }"
        @keydown.escape="open_select_menu = false"
        @click.away="open_select_menu = false"
        class="relative z-0 inline-block shadow-sm -space-x-px mx-4"
    >
      <button @click="open_select_menu = !open_select_menu" type="button" aria-haspopup="listbox" aria-expanded="true" aria-labelledby="listbox-label" class="bg-white relative w-full border border-gray-300 rounded-md shadow-sm pl-3 pr-10 py-2 text-left cursor-default focus:outline-none sm:text-sm">
        <span class="block truncate">
          <%= @selected %>
        </span>
        <span class="absolute inset-y-0 right-0 flex items-center pr-2 pointer-events-none">
          <svg class="h-5 w-5 text-gray-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
            <path fill-rule="evenodd" d="M10 3a1 1 0 01.707.293l3 3a1 1 0 01-1.414 1.414L10 5.414 7.707 7.707a1 1 0 01-1.414-1.414l3-3A1 1 0 0110 3zm-3.707 9.293a1 1 0 011.414 0L10 14.586l2.293-2.293a1 1 0 011.414 1.414l-3 3a1 1 0 01-1.414 0l-3-3a1 1 0 010-1.414z" clip-rule="evenodd" />
          </svg>
        </span>
      </button>
      <div
        @click="open_select_menu = false"
        x-show="open_select_menu"
        x-transition:enter="transition ease-out duration-100"
        x-transition:enter-start="transform opacity-0 scale-95"
        x-transition:enter-end="transform opacity-100 scale-100"
        x-transition:leave="transition ease-in duration-75"
        x-transition:leave-start="transform opacity-100 scale-100"
        x-transition:leave-end="transform opacity-0 scale-95"
        class="absolute mt-1 w-full rounded-md bg-white shadow-lg"
      >
        <ul tabindex="-1" role="listbox" aria-labelledby="listbox-label" aria-activedescendant="listbox-item-3" class="max-h-60 rounded-md py-1 text-base ring-1 ring-black ring-opacity-5 overflow-auto focus:outline-none sm:text-sm">
          <%= for rows_per_page <- @select_options do %>
            <%= if rows_per_page == @selected do %>
              <li
                phx-click="select-per-page-test"
                phx-value-per-page="<%= rows_per_page %>"
                id="listbox-option-0"
                role="option"
                class="text-gray-900 cursor-default select-none relative py-2 pl-3 pr-9 hover:text-white hover:bg-indigo-500"
              >
                <span class="font-semibold block truncate">
                  <%= rows_per_page %>
                </span>
                <span class="text-indigo-500 absolute inset-y-0 right-0 flex items-center pr-4">
                  <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                    <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd" />
                  </svg>
                </span>
              </li>
            <% else %>
              <li
                phx-click="select-per-page-test"
                phx-value-per-page="<%= rows_per_page %>"
                id="listbox-option-0"
                role="option"
                class="text-gray-900 cursor-default select-none relative py-2 pl-3 pr-9 hover:text-white hover:bg-indigo-500"
              >
                <span class="font-normal block truncate">
                  <%= rows_per_page %>
                </span>
                <span class="hidden text-indigo-500 absolute inset-y-0 right-0 flex items-center pr-4">
                  <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                    <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd" />
                  </svg>
                </span>
              </li>
            <% end %>
          <% end %>
        </ul>
      </div>
    </div>
    """
  end
end

# <form phx-change="select-per-page" class="select-form">
#         <select name="per-page">
#                 <%= options_for_select([5, 10, 15, 20], @options.per_page) %>
#         </select>
# </form>

# <form phx-change="select-per-page">
#     <select name="per-page" class="mt-1 block w-full pl-3 pr-10 py-2 text-base border-gray-300 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm rounded-md">
#         <%= for rows_per_page <- [5, 10, 15, 20] do %>
#                 <%= if rows_per_page == @options.per_page do %>
#                         <option value="<%= rows_per_page %>" selected><%= rows_per_page %></option>
#                 <%= else %>
#                         <option value="<%= rows_per_page %>"><%= rows_per_page %></option>
#                 <%= end %>
#         <% end %>
#     </select>
# </form>
