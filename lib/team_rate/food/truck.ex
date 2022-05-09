defmodule TeamRate.Food.Truck do
  use Ecto.Schema
  import Ecto.Changeset

  schema "trucks" do
    field :address, :string
    field :food_items, :string
    field :joe_rate, :integer
    field :miao_rate, :integer
    field :name, :string
    field :nate_rate, :integer
    field :status, :string
    field :team_rate, :integer
    field :tess_rate, :integer

    timestamps()
  end

  @doc false
  def changeset(truck, attrs) do
    truck
    |> cast(attrs, [:name, :address, :status, :food_items, :nate_rate, :tess_rate, :joe_rate, :miao_rate, :team_rate])
    |> validate_required([:name, :address, :status, :food_items])# :nate_rate, :tess_rate, :joe_rate, :miao_rate, :team_rate])
  end
end
