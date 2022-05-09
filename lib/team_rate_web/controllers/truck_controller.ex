defmodule TeamRateWeb.TruckController do
  use TeamRateWeb, :controller

  alias TeamRate.Food
  alias TeamRate.Food.Truck

  def index(conn, _params) do
    trucks = Food.list_trucks()
    render(conn, "index.html", trucks: trucks)
  end

  def new(conn, _params) do
    changeset = Food.change_truck(%Truck{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"truck" => truck_params}) do
    case Food.create_truck(truck_params) do
      {:ok, truck} ->
        conn
        |> put_flash(:info, "Truck created successfully.")
        |> redirect(to: Routes.truck_path(conn, :show, truck))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    truck = Food.get_truck!(id)
    render(conn, "show.html", truck: truck)
  end

  def edit(conn, %{"id" => id}) do
    truck = Food.get_truck!(id)
    changeset = Food.change_truck(truck)
    render(conn, "edit.html", truck: truck, changeset: changeset)
  end

  def update(conn, %{"id" => id, "truck" => truck_params}) do
    truck = Food.get_truck!(id)

    case Food.update_truck(truck, truck_params) do
      {:ok, truck} ->
        conn
        |> put_flash(:info, "Truck updated successfully.")
        |> redirect(to: Routes.truck_path(conn, :show, truck))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", truck: truck, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    truck = Food.get_truck!(id)
    {:ok, _truck} = Food.delete_truck(truck)

    conn
    |> put_flash(:info, "Truck deleted successfully.")
    |> redirect(to: Routes.truck_path(conn, :index))
  end
end
