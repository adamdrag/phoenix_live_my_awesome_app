defmodule MyAwesomeApp.Claims.Claim do
  use Ecto.Schema
  import Ecto.Changeset

  schema "claims" do
    field :billed_amount, :decimal
    field :claim, :integer
    field :claim_type, :string
    field :days_to_pay, :integer
    field :discount, :decimal
    field :paid_date, :date
    field :pct_discount, :decimal
    field :provider, :string
    field :provider_location, :string

    timestamps()
  end

  @doc false
  def changeset(claim, attrs) do
    claim
    |> cast(attrs, [:billed_amount, :claim, :claim_type, :days_to_pay, :discount, :paid_date, :pct_discount, :provider, :provider_location])
    |> validate_required([:billed_amount, :claim, :claim_type, :days_to_pay, :discount, :paid_date, :pct_discount, :provider, :provider_location])
  end
end
