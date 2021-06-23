defmodule Wabanex.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :name, :string
    field :password, :string

    timestamps();
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params)
  end
end
