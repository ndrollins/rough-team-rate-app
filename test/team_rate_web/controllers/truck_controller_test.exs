defmodule TeamRateWeb.TruckControllerTest do
  use TeamRateWeb.ConnCase

  import TeamRate.FoodFixtures

  @create_attrs %{address: "some address", food_items: "some food_items", joe_rate: 42, miao_rate: 42, name: "some name", nate_rate: 42, status: "some status", team_rate: 42, tess_rate: 42}
  @update_attrs %{address: "some updated address", food_items: "some updated food_items", joe_rate: 43, miao_rate: 43, name: "some updated name", nate_rate: 43, status: "some updated status", team_rate: 43, tess_rate: 43}
  @invalid_attrs %{address: nil, food_items: nil, joe_rate: nil, miao_rate: nil, name: nil, nate_rate: nil, status: nil, team_rate: nil, tess_rate: nil}

  describe "index" do
    test "lists all trucks", %{conn: conn} do
      conn = get(conn, Routes.truck_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Trucks"
    end
  end

  describe "new truck" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.truck_path(conn, :new))
      assert html_response(conn, 200) =~ "New Truck"
    end
  end

  describe "create truck" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.truck_path(conn, :create), truck: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.truck_path(conn, :show, id)

      conn = get(conn, Routes.truck_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Truck"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.truck_path(conn, :create), truck: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Truck"
    end
  end

  describe "edit truck" do
    setup [:create_truck]

    test "renders form for editing chosen truck", %{conn: conn, truck: truck} do
      conn = get(conn, Routes.truck_path(conn, :edit, truck))
      assert html_response(conn, 200) =~ "Edit Truck"
    end
  end

  describe "update truck" do
    setup [:create_truck]

    test "redirects when data is valid", %{conn: conn, truck: truck} do
      conn = put(conn, Routes.truck_path(conn, :update, truck), truck: @update_attrs)
      assert redirected_to(conn) == Routes.truck_path(conn, :show, truck)

      conn = get(conn, Routes.truck_path(conn, :show, truck))
      assert html_response(conn, 200) =~ "some updated address"
    end

    test "renders errors when data is invalid", %{conn: conn, truck: truck} do
      conn = put(conn, Routes.truck_path(conn, :update, truck), truck: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Truck"
    end
  end

  describe "delete truck" do
    setup [:create_truck]

    test "deletes chosen truck", %{conn: conn, truck: truck} do
      conn = delete(conn, Routes.truck_path(conn, :delete, truck))
      assert redirected_to(conn) == Routes.truck_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.truck_path(conn, :show, truck))
      end
    end
  end

  defp create_truck(_) do
    truck = truck_fixture()
    %{truck: truck}
  end
end
