defmodule TeamRate.Repo.Migrations.CreateTrucks do
  use Ecto.Migration

  def change do
    create table(:trucks) do
      add :name, :string
      add :address, :string
      add :status, :string
      add :food_items, :string
      add :nate_rate, :integer
      add :tess_rate, :integer
      add :joe_rate, :integer
      add :miao_rate, :integer
      add :team_rate, :integer

      timestamps()
    end
  end
end
