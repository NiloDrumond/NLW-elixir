defmodule Wabanex.Users.Update do
  alias Wabanex.{Repo, Users}
  require Logger

  def call(params) do
    {:ok, user} = Users.Get.call(params[:id])
    params_map = Enum.into(params, %{})

    user
    |> Ecto.Changeset.change(params_map)
    |> Repo.update()
  end
end
