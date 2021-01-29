defmodule MyAwesomeAppWeb.Pages.AlpineExamplesLive.Index do
  use MyAwesomeAppWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
      <%= live_component @socket, MyAwesomeAppWeb.Components.PageTitleLive, title: "Alpine Examples" %>

      <div class="flex justify-center">
        <div
          id="<%= if connected?(@socket), do: 'connected-id', else: 'not-connected-id' %>"
          x-data="{ open_options: false }"
          @keydown.escape="open_options = false"
          @click.away="open_options = false"
          class="relative inline-block text-left"
        >
            <div>
              <span class="rounded-md shadow-sm">
                  <button
                    @click="open_options = !open_options"
                    type="button"
                    class="inline-flex justify-center w-full rounded-md border border-gray-300 px-4 py-2 bg-white text-sm leading-5 font-medium text-gray-700 hover:text-gray-500 focus:outline-none focus:border-blue-300 focus:shadow-outline-blue active:bg-gray-50 active:text-gray-800 transition ease-in-out duration-150"
                  >
                      Options
                  <svg class="-mr-1 ml-2 h-5 w-5" fill="currentColor" viewBox="0 0 20 20">
                      <path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd"/>
                  </svg>
                  </button>
              </span>
            </div>
            <div
              x-show="open_options"
              x-transition:enter="transition ease-out duration-100"
              x-transition:enter-start="transform opacity-0 scale-95"
              x-transition:enter-end="transform opacity-100 scale-100"
              x-transition:leave="transition ease-in duration-75"
              x-transition:leave-start="transform opacity-100 scale-100"
              x-transition:leave-end="transform opacity-0 scale-95"
              class="origin-top-right absolute right-0 mt-2 w-56 rounded-md shadow-lg"
            >
              <div class="rounded-md bg-white shadow-xs">
                  <div class="py-1">
                  <a href="#" class="block px-4 py-2 text-sm leading-5 text-gray-700 hover:bg-gray-100 hover:text-gray-900 focus:outline-none focus:bg-gray-100 focus:text-gray-900">Edit</a>
                  <a href="#" class="block px-4 py-2 text-sm leading-5 text-gray-700 hover:bg-gray-100 hover:text-gray-900 focus:outline-none focus:bg-gray-100 focus:text-gray-900">Duplicate</a>
                  </div>
                  <div class="border-t border-gray-100"></div>
                  <div class="py-1">
                  <a href="#" class="block px-4 py-2 text-sm leading-5 text-gray-700 hover:bg-gray-100 hover:text-gray-900 focus:outline-none focus:bg-gray-100 focus:text-gray-900">Delete</a>
                  </div>
              </div>
            </div>
        </div>
      </div>
    """
  end
end

# LiveView renders twice. First when the server renders the page and the second time when the LiveView web socket connects to the server.
# When that happens, Alpine loses track of the DOM element.