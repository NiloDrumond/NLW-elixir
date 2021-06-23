defmodule Wabanex.Users.Get do
  alias Wabanex.{Repo, User}
alias Ecto.UUID

  def call(id) do
    id
    |> User.changeset()
    |> Repo.insert()
  end
end
