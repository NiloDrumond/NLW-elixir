defmodule Wabanex.Repo.Migrations.CreateExercisesTable do
  use Ecto.Migration

  def change do
    create table(:exercises, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string
      add :youtube_video_url, :string
      add :protocol_description, :string
      add :repetitions, :string
      add :training_id, references(:trainings, on_delete: :delete_all)

      timestamps()
    end
  end
end
