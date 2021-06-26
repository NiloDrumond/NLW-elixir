defmodule Wabanex.Trainings.Update do
  alias Wabanex.{Repo, Trainings, Training}
  require Logger

  def call(params) do
    {:ok, training} = Trainings.Get.call(params[:id])

    # params_map = Enum.into(params, %{})

    Training.changeset(:update, training, params)
    |> Repo.update()
  end
end
