defmodule WabanexWeb.Schema.Types.User do
  use Absinthe.Schema.Notation

  @desc "Logic user representation"
  object :user do
    field :id, non_null(:uuid4)
    field :name, non_null(:string)
    field :email, non_null(:string)
    field :trainings, list_of(:training)
    field :weight, non_null(:float)
    field :height, non_null(:float)
  end

  input_object :create_user_input do
    field :name, non_null(:string), description: "User's name"
    field :email, non_null(:string), description: "User's email"
    field :password, non_null(:string), description: "User's password"
    field :weight, non_null(:float), description: "Users weight"
    field :height, non_null(:float), description: "Users height"
  end

  input_object :update_user_input do
    field :id, non_null(:uuid4), description: "User's id"
    field :name, :string, description: "User's name"
    field :email, :string, description: "User's email"
    field :password, :string, description: "User's password"
    field :weight, :float, description: "Users weight"
    field :height, :float, description: "Users height"
  end
end
