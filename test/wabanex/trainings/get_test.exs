defmodule Wabanex.Trainings.GetTest do
  use Wabanex.DataCase, async: true
  alias Wabanex.{Training, Trainings, User, Users}

  describe "call/1" do
    test "when the id is not a valid UUID" do
      params = "invalid_id"

      response = Trainings.Get.call(params)

      expected_response = {:error, "Invalid UUID"}

      assert response == expected_response
    end

    test "when there is no training with the id" do
      params = "a72bee4f-1d2a-4409-80c1-d4bbf6ced8cb"

      response = Trainings.Get.call(params)

      expected_response = {:error, "Training not found"}

      assert response == expected_response
    end

    test "when the id is valid and has a training has it" do
      user_params = %{
        name: "Teste",
        email: "teste@teste.com",
        password: "123456",
        weight: 56.5,
        height: 1.75
      }

      {:ok, %User{id: user_id}} = Users.Create.call(user_params)

      training_params = %{
        user_id: user_id,
        start_date: "2021-09-02",
        end_date: "2021-09-29",
        exercises: [
          %{
            name: "supinho",
            protocol_description: "Regular",
            repetitions: "3x12",
            youtube_video_url: "www.google.com"
          },
          %{
            name: "supinho brabo",
            protocol_description: "Regular",
            repetitions: "3x12",
            youtube_video_url: "www.google.com"
          }
        ]
      }

      {:ok, %Training{id: training_id}} = Trainings.Create.call(training_params)

      response = Trainings.Get.call(training_id)

      assert {:ok, %Training{}} = response
    end
  end
end
