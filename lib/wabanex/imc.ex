defmodule Wabanex.IMC do
  def calculate({weight, height}) do
    try do
      imc = weight / (height * height)
      {:ok, imc}
    rescue
      ArithmeticError -> {:error, "Arithmetic Error"}
    end
  end
end
