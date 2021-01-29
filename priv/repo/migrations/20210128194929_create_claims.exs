defmodule MyAwesomeApp.Repo.Migrations.CreateClaims do
  use Ecto.Migration

  def change do
    create table(:claims) do
      add :billed_amount, :decimal
      add :claim, :integer
      add :claim_type, :string
      add :days_to_pay, :integer
      add :discount, :decimal
      add :paid_date, :date
      add :pct_discount, :decimal
      add :provider, :string
      add :provider_location, :string

      timestamps()
    end

  end
end
