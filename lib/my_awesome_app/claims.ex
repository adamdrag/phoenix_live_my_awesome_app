defmodule MyAwesomeApp.Claims do
  @moduledoc """
  The Claims context.
  """

  import Ecto.Query, warn: false
  alias MyAwesomeApp.Repo

  alias MyAwesomeApp.Claims.Claim

  def list_claims do
    Repo.all(Claim)
  end

  @doc """
  Returns a list of claims matching the given `criteria`.

  Example Criteria:

  [
   paginate: %{page: 2, per_page: 5},
   sort: %{sort_by: :item, sort_order: :asc}
   filter: %{filter_by: :field, filter_operator: >, filter_value: nil}
  ]
  """

  def list_claims(criteria) when is_list(criteria) do
    query = from(d in Claim)

    Enum.reduce(criteria, query, fn
      {:paginate, %{page: page, per_page: per_page}}, query ->
        from q in query,
          offset: ^((page - 1) * per_page),
          limit: ^per_page

      {:sort, %{sort_by: sort_by, sort_order: sort_order}}, query ->
        from q in query, order_by: [{^sort_order, ^sort_by}]

      {:filter,
       %{filter_by: filter_by, filter_operator: filter_operator, filter_value: filter_value}},
      query ->
        case filter_operator do
          ">" -> from q in query, where: field(q, ^filter_by) > ^filter_value
          "<" -> from q in query, where: field(q, ^filter_by) < ^filter_value
          _ -> query
        end
    end)
    |> Repo.all()
  end

  def get_claim!(id), do: Repo.get!(Claim, id)

  def create_claim(attrs \\ %{}) do
    %Claim{}
    |> Claim.changeset(attrs)
    |> Repo.insert()
  end

  def update_claim(%Claim{} = claim, attrs) do
    claim
    |> Claim.changeset(attrs)
    |> Repo.update()
  end

  def delete_claim(%Claim{} = claim) do
    Repo.delete(claim)
  end

  def change_claim(%Claim{} = claim, attrs \\ %{}) do
    Claim.changeset(claim, attrs)
  end
end
