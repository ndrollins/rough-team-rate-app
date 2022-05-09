defmodule TeamRate.Food do
  @moduledoc """
  The Food context.
  """

  import Ecto.Query, warn: false
  alias NimbleCSV.RFC4180, as: CSV
  alias TeamRate.Repo

  alias TeamRate.Food.Truck

  @doc """
  Returns the list of trucks.

  ## Examples

      iex> list_trucks()
      [%Truck{}, ...]

  """
  def list_trucks do
    Repo.all(Truck)
  end

  @doc """
  Gets a single truck.

  Raises `Ecto.NoResultsError` if the Truck does not exist.

  ## Examples

      iex> get_truck!(123)
      %Truck{}

      iex> get_truck!(456)
      ** (Ecto.NoResultsError)

  """
  def get_truck!(id), do: Repo.get!(Truck, id)

  @doc """
  Creates a truck.

  ## Examples

      iex> create_truck(%{field: value})
      {:ok, %Truck{}}

      iex> create_truck(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_truck(attrs \\ %{}) do
    %Truck{}
    |> Truck.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a truck.

  ## Examples

      iex> update_truck(truck, %{field: new_value})
      {:ok, %Truck{}}

      iex> update_truck(truck, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_truck(%Truck{} = truck, attrs) do
    truck
    |> Truck.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a truck.

  ## Examples

      iex> delete_truck(truck)
      {:ok, %Truck{}}

      iex> delete_truck(truck)
      {:error, %Ecto.Changeset{}}

  """
  def delete_truck(%Truck{} = truck) do
    Repo.delete(truck)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking truck changes.

  ## Examples

      iex> change_truck(truck)
      %Ecto.Changeset{data: %Truck{}}

  """
  def change_truck(%Truck{} = truck, attrs \\ %{}) do
    Truck.changeset(truck, attrs)
  end

  def pull_rows_from_file(file, 488, row) do
    {:ok, "done"}
  end

  def pull_rows_from_file(file, row_num, row) do
    row_num = row_num + 1
    all_rows =
      file
        |> File.stream!()
        |> CSV.parse_stream(skip_headers: false)
        |> Enum.fetch!(row_num)
        |> Enum.with_index()
        |> Map.new(fn {val, num} -> {num, val} end)
    row = Enum.reduce([1, 5, 10, 11], [],
      fn x,acc ->
        [Map.get(all_rows, x) | acc]
      end)
      |> Enum.reverse
      |> Enum.with_index
      |> Map.new(fn {val, num} ->
        case num do
          0 -> {:name, val}
          1 -> {:address, val}
          2 -> {:status, val}
          3 -> {:food_items, val}
        end
        end)
      |> IO.inspect
      |> create_truck()
    pull_rows_from_file(file, row_num, row)
  end
end
