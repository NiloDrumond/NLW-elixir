defmodule Wabanex.Repo.Migrations.AddWeightColumn do
  use Ecto.Migration

  def change do
    alter table("users") do
      add :weight, :float
    end
  end
end
