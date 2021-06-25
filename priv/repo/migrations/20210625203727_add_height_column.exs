defmodule Wabanex.Repo.Migrations.AddHeightColumn do
  use Ecto.Migration

  def change do
    alter table("users") do
      add :height, :float
    end
  end
end
