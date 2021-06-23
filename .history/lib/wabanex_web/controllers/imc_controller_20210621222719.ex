defmodule WabanexWeb.IMCController do
  use WabanexWeb, :controller

  alias Wabanex.IMC

  def index(conn, params) do
    params
    |> IMC.calculate()
    |> handle_response(conn)

  end

  def handle_response({:ok, result}, conn) do
    conn
    |> put_status(:ok)
    |> json(result)
  end
end
