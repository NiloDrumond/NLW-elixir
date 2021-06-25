defmodule Wabanex.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Wabanex.Training

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  @fields [:email, :name, :password, :weight, :height]

  schema "users" do
    field :email, :string
    field :name, :string
    field :password, :string
    field :weight, :float
    field :height, :float

    has_many :trainings, Training

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @fields)
    |> validate_required(@fields)
    |> validate_length(:password, min: 6)
    |> validate_length(:name, min: 2)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint([:email])
  end
end
