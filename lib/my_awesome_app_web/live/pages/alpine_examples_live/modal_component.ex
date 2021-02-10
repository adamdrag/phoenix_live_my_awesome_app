defmodule MyAwesomeAppWeb.Pages.AlpineExamplesLive.ModalComponent do
  use MyAwesomeAppWeb, :live_component

  def render(assigns) do
    ~L"""
      <div class="mt-12 mb-4">
        <%= render(MyAwesomeAppWeb.ComponentView, "text_in_border_line.html", text: "Modal", bg_color: "bg-gray-200" ) %>
      </div>
      <div
        id="modal-alpine"
        x-data="{ 'showModal': false }"
        @keydown.escape="showModal = false"
        @click.away="showModal = false"
      >
        <div class="flex items-center justify-center my-6">
          <button
            @click="showModal = true"
            class="bg-transparent border border-gray-500 hover:border-indigo-500 text-gray-500 hover:text-indigo-500 font-bold py-2 px-4 rounded-full"
          >
            Open Modal
          </button>
        </div>
        <div
          x-show="showModal"
          x-transition:enter="transition ease-out duration-100"
          x-transition:enter-start="transform opacity-0 scale-95"
          x-transition:enter-end="transform opacity-100 scale-100"
          x-transition:leave="transition ease-in duration-75"
          x-transition:leave-start="transform opacity-100 scale-100"
          x-transition:leave-end="transform opacity-0 scale-95"
          class="modal opacity 0.25s ease pointer-events-none absolute w-full h-full top-0 left-0 flex items-center justify-center"
        >
          <div @click.away="showModal = false" class="modal-overlay absolute w-full h-full bg-black opacity-25 top-0 left-0 cursor-pointer"></div>
          <div class="absolute z-10 w-1/2 h-32 bg-white rounded-sm shadow-lg flex items-center justify-center text-2xl">
            <p>Modal content can go here</p>
          </div>
        </div>
      </div>
    """
  end
end
