defmodule WabanexWeb.IMCController do
  use WabanexWeb, :controller

  alias Wabanex.IMC

  def index(conn, params) do
    # params
    # |> IMC.calculate()

    IO.inspect(params)
    IO.inspect(conn)

    conn
  end
end
