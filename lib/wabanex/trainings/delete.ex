defmodule Wabanex.Trainings.Delete do
  alias Wabanex.{Repo, Training}
  alias Ecto.UUID

  def call(id) do
    id
    |> UUID.cast()
    |> handle_cast_response()
  end

  defp handle_cast_response(:error) do
    {:error, "Invalid UUID"}
  end

  defp handle_cast_response({:ok, uuid}) do
    try do
      training = Repo.get!(Training, uuid)

      case Repo.delete(training) do
        {:ok, struct} -> {:ok, struct}
        {:error, _changeset} -> {:error, "Failed to delete training"}
      end
    rescue
      Ecto.NoResultsError -> {:error, "Training not found"}
    end
  end
end
