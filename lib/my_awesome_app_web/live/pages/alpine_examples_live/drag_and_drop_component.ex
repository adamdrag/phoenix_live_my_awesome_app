defmodule MyAwesomeAppWeb.Pages.AlpineExamplesLive.DragAndDropComponent do
  use MyAwesomeAppWeb, :live_component

  def render(assigns) do
    ~L"""
      <div class="mt-12 mb-4">
        <%= render(MyAwesomeAppWeb.ComponentView, "text_in_border_line.html", text: "Drag and Drop File Upload", bg_color: "bg-gray-200" ) %>
      </div>
    """
  end
end
