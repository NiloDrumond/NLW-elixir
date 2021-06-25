defmodule Wabanex.Users.Delete do
  alias Wabanex.{Repo, User}
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
      user = Repo.get!(User, uuid)

      case Repo.delete(user) do
        {:ok, struct} -> {:ok, struct}
        {:error, _changeset} -> {:error, "Failed to delete user"}
      end
    rescue
      Ecto.NoResultsError -> {:error, "User not found"}
    end
  end
end
