defmodule MyAwesomeApp.ClaimsTest do
  use MyAwesomeApp.DataCase

  alias MyAwesomeApp.Claims

  describe "claims" do
    alias MyAwesomeApp.Claims.Claim

    @valid_attrs %{billed_amount: "120.5", claim: 42, claim_type: "some claim_type", days_to_pay: 42, discount: "120.5", paid_date: ~D[2010-04-17], pct_discount: "120.5", provider: "some provider", provider_location: "some provider_location"}
    @update_attrs %{billed_amount: "456.7", claim: 43, claim_type: "some updated claim_type", days_to_pay: 43, discount: "456.7", paid_date: ~D[2011-05-18], pct_discount: "456.7", provider: "some updated provider", provider_location: "some updated provider_location"}
    @invalid_attrs %{billed_amount: nil, claim: nil, claim_type: nil, days_to_pay: nil, discount: nil, paid_date: nil, pct_discount: nil, provider: nil, provider_location: nil}

    def claim_fixture(attrs \\ %{}) do
      {:ok, claim} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Claims.create_claim()

      claim
    end

    test "list_claims/0 returns all claims" do
      claim = claim_fixture()
      assert Claims.list_claims() == [claim]
    end

    test "get_claim!/1 returns the claim with given id" do
      claim = claim_fixture()
      assert Claims.get_claim!(claim.id) == claim
    end

    test "create_claim/1 with valid data creates a claim" do
      assert {:ok, %Claim{} = claim} = Claims.create_claim(@valid_attrs)
      assert claim.billed_amount == Decimal.new("120.5")
      assert claim.claim == 42
      assert claim.claim_type == "some claim_type"
      assert claim.days_to_pay == 42
      assert claim.discount == Decimal.new("120.5")
      assert claim.paid_date == ~D[2010-04-17]
      assert claim.pct_discount == Decimal.new("120.5")
      assert claim.provider == "some provider"
      assert claim.provider_location == "some provider_location"
    end

    test "create_claim/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Claims.create_claim(@invalid_attrs)
    end

    test "update_claim/2 with valid data updates the claim" do
      claim = claim_fixture()
      assert {:ok, %Claim{} = claim} = Claims.update_claim(claim, @update_attrs)
      assert claim.billed_amount == Decimal.new("456.7")
      assert claim.claim == 43
      assert claim.claim_type == "some updated claim_type"
      assert claim.days_to_pay == 43
      assert claim.discount == Decimal.new("456.7")
      assert claim.paid_date == ~D[2011-05-18]
      assert claim.pct_discount == Decimal.new("456.7")
      assert claim.provider == "some updated provider"
      assert claim.provider_location == "some updated provider_location"
    end

    test "update_claim/2 with invalid data returns error changeset" do
      claim = claim_fixture()
      assert {:error, %Ecto.Changeset{}} = Claims.update_claim(claim, @invalid_attrs)
      assert claim == Claims.get_claim!(claim.id)
    end

    test "delete_claim/1 deletes the claim" do
      claim = claim_fixture()
      assert {:ok, %Claim{}} = Claims.delete_claim(claim)
      assert_raise Ecto.NoResultsError, fn -> Claims.get_claim!(claim.id) end
    end

    test "change_claim/1 returns a claim changeset" do
      claim = claim_fixture()
      assert %Ecto.Changeset{} = Claims.change_claim(claim)
    end
  end
end
