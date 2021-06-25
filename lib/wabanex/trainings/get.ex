defmodule Wabanex.Trainings.Get do
  alias Wabanex.{Repo, Training}
  alias Ecto.UUID

  def call(id) do
    id
    |> UUID.cast()
    |> handle_response()
  end

  defp handle_response(:error) do
    {:error, "Invalid UUID"}
  end

  defp handle_response({:ok, uuid}) do
    case Repo.get(Training, uuid) do
      nil -> {:error, "Training not found"}
      training -> {:ok, load_exercises(training)}
    end
  end

  defp load_exercises(training) do
    Repo.preload(training, :exercises)
  end
end
