defmodule Wabanex.Repo.Migrations.CreateTrainingsTable do
  use Ecto.Migration

  def change do
    create table(:trainings, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :start_date, :date
      add :end_date, :date
      add :user_id, references(:users, on_delete: :delete_all)

      timestamps()
    end
  end
end
