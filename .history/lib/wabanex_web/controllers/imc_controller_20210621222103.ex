defmodule WabanexWeb.IMCController do
  use WabanexWeb, :controller

  alias Wabanex.IMC

  def index(conn, params) do
    params
    |> IMC.calculate()
    |> handle_response(conn)
  end
end
