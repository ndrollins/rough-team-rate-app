defmodule TeamRate.FoodTest do
  use TeamRate.DataCase

  alias TeamRate.Food

  describe "trucks" do
    alias TeamRate.Food.Truck

    import TeamRate.FoodFixtures

    @invalid_attrs %{address: nil, food_items: nil, joe_rate: nil, miao_rate: nil, name: nil, nate_rate: nil, status: nil, team_rate: nil, tess_rate: nil}

    test "list_trucks/0 returns all trucks" do
      truck = truck_fixture()
      assert Food.list_trucks() == [truck]
    end

    test "get_truck!/1 returns the truck with given id" do
      truck = truck_fixture()
      assert Food.get_truck!(truck.id) == truck
    end

    test "create_truck/1 with valid data creates a truck" do
      valid_attrs = %{address: "some address", food_items: "some food_items", joe_rate: 42, miao_rate: 42, name: "some name", nate_rate: 42, status: "some status", team_rate: 42, tess_rate: 42}

      assert {:ok, %Truck{} = truck} = Food.create_truck(valid_attrs)
      assert truck.address == "some address"
      assert truck.food_items == "some food_items"
      assert truck.joe_rate == 42
      assert truck.miao_rate == 42
      assert truck.name == "some name"
      assert truck.nate_rate == 42
      assert truck.status == "some status"
      assert truck.team_rate == 42
      assert truck.tess_rate == 42
    end

    test "create_truck/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Food.create_truck(@invalid_attrs)
    end

    test "update_truck/2 with valid data updates the truck" do
      truck = truck_fixture()
      update_attrs = %{address: "some updated address", food_items: "some updated food_items", joe_rate: 43, miao_rate: 43, name: "some updated name", nate_rate: 43, status: "some updated status", team_rate: 43, tess_rate: 43}

      assert {:ok, %Truck{} = truck} = Food.update_truck(truck, update_attrs)
      assert truck.address == "some updated address"
      assert truck.food_items == "some updated food_items"
      assert truck.joe_rate == 43
      assert truck.miao_rate == 43
      assert truck.name == "some updated name"
      assert truck.nate_rate == 43
      assert truck.status == "some updated status"
      assert truck.team_rate == 43
      assert truck.tess_rate == 43
    end

    test "update_truck/2 with invalid data returns error changeset" do
      truck = truck_fixture()
      assert {:error, %Ecto.Changeset{}} = Food.update_truck(truck, @invalid_attrs)
      assert truck == Food.get_truck!(truck.id)
    end

    test "delete_truck/1 deletes the truck" do
      truck = truck_fixture()
      assert {:ok, %Truck{}} = Food.delete_truck(truck)
      assert_raise Ecto.NoResultsError, fn -> Food.get_truck!(truck.id) end
    end

    test "change_truck/1 returns a truck changeset" do
      truck = truck_fixture()
      assert %Ecto.Changeset{} = Food.change_truck(truck)
    end
  end
end
