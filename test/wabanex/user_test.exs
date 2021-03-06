defmodule Wabanex.UserTest do
  use Wabanex.DataCase, async: true

  alias Wabanex.User

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{
        name: "Teste",
        email: "teste@gmail.com",
        password: "123456",
        weight: 56.5,
        height: 1.75
      }

      response = User.changeset(params)

      assert %Ecto.Changeset{
               valid?: true,
               changes: %{
                 email: "teste@gmail.com",
                 name: "Teste",
                 password: "123456",
                 weight: 56.5,
                 height: 1.75
               },
               errors: []
             } = response
    end

    test "when no password is sent, returns an invalid changeset" do
      params = %{name: "Teste", email: "teste@gmail.com", weight: 56.5, height: 1.75}

      response = User.changeset(params)

      expected_response = %{password: ["can't be blank"]}

      assert errors_on(response) == expected_response
    end
  end
end
