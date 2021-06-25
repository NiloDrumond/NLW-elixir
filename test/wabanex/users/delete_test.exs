defmodule Wabanex.Users.DeleteTest do
  use Wabanex.DataCase, async: true
  alias Wabanex.{User, Users}

  describe "call/1" do
    test "when the id is not a valid UUID" do
      params = "invalid_id"

      response = Users.Delete.call(params)

      expected_response = {:error, "Invalid UUID"}

      assert response == expected_response
    end

    test "when there is no user with the id" do
      params = "a72bee4f-1d2a-4409-80c1-d4bbf6ced8cb"

      response = Users.Delete.call(params)

      expected_response = {:error, "User not found"}

      assert response == expected_response
    end

    test "when the id is valid and has a user has it" do
      params = "a72bee4f-1d2a-4409-80c1-d4bbf6ced8cb"

      response = Users.Delete.call(params)

      expected_response = {:error, "User not found"}

      assert response == expected_response
    end
  end
end
