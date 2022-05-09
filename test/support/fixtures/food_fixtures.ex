defmodule TeamRate.FoodFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TeamRate.Food` context.
  """

  @doc """
  Generate a truck.
  """
  def truck_fixture(attrs \\ %{}) do
    {:ok, truck} =
      attrs
      |> Enum.into(%{
        address: "some address",
        food_items: "some food_items",
        joe_rate: 42,
        miao_rate: 42,
        name: "some name",
        nate_rate: 42,
        status: "some status",
        team_rate: 42,
        tess_rate: 42
      })
      |> TeamRate.Food.create_truck()

    truck
  end
end
