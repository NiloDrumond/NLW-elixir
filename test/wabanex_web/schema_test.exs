defmodule WabanexWeb.SchemaTest do
  use WabanexWeb.ConnCase, async: true
  alias Wabanex.{User, Users}

  describe "users queries" do
    test "when a valid id is given, returns the user", %{conn: conn} do
      params = %{
        name: "Teste",
        email: "teste@teste.com",
        password: "123456",
        weight: 56.5,
        height: 1.75
      }

      {:ok, %User{id: user_id}} = Users.Create.call(params)

      query = """
        {
          getUser(id: "#{user_id}") {
          name
          email
          }
        }
      """

      response =
        conn
        |> post("/api/graphql", %{query: query})
        |> json_response(:ok)

      expected_response = %{
        "data" => %{"getUser" => %{"email" => "teste@teste.com", "name" => "Teste"}}
      }

      assert response == expected_response
    end
  end

  describe "users mutations" do
    test "when all params are valid, creates the user", %{conn: conn} do
      mutation = """
        mutation {
          createUser(input: {
            email: "teste2@teste.com",
            name: "Teste2",
            password: "123456",
            weight: 56.5,
            height: 1.75
          }) {
            id
            name
            email
          }
        }
      """

      response =
        conn
        |> post("/api/graphql", %{query: mutation})
        |> json_response(:ok)

      assert %{"data" => %{"createUser" => %{"id" => _id, "name" => "Teste2"}}} = response
    end
  end
end
