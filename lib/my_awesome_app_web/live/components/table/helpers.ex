defmodule MyAwesomeAppWeb.Components.TableLive.Helpers do
  def operators(type) do
    case type do
      "money" ->
        [
          %{label: "Greater then", value: ">"},
          %{label: "Less then", value: "<"}
        ]

      "number" ->
        [
          %{label: "Greater then", value: ">"},
          %{label: "Less then", value: "<"}
        ]

      "float" ->
        [
          %{label: "Greater then", value: ">"},
          %{label: "Less then", value: "<"}
        ]

      "text" ->
        [
          %{label: "Starts with", value: ""},
          %{label: "Contains", value: ""}
        ]

      "date" ->
        [
          %{label: "Starts at", value: ""},
          %{label: "Ends at", value: ""}
        ]

      _ ->
        []
    end
  end

  def parse_subject_value("") do
    ["", "", nil]
  end

  def parse_subject_value(subject) do
    String.split(subject, "^^^")
  end

  def parse_operator_value("") do
    ["", ""]
  end

  def parse_operator_value(subject) do
    String.split(subject, "^^^")
  end
end
