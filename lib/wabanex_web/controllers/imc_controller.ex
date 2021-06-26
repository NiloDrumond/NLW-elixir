defmodule WabanexWeb.IMCController do
  use WabanexWeb, :controller
  require Logger
  alias Wabanex.{Users, User, IMC}

  def show(conn, %{"id" => id}) do
    Logger.info(id)

    id
    |> Users.Get.call()
    |> handle_user_query(conn)
  end

  defp handle_user_query({:ok, result}, conn) do
    %User{weight: user_weight, height: user_height} = result

    IMC.calculate({user_weight, user_height})
    |> handle_calculate(conn)
  end

  defp handle_user_query({:error, error}, conn),
    do: render_response(conn, error, :internal_server_error)

  defp handle_calculate({:ok, result}, conn), do: render_response(conn, result, :ok)

  defp handle_calculate({:error, error}, conn),
    do: render_response(conn, error, :internal_server_error)

  defp render_response(conn, result, status) do
    conn
    |> put_status(status)
    |> json(%{result: result})
  end
end
