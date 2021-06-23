defmodule Wabanex.IMC do
  def calculate(filename) do
    filename
    |> File.read()
    |> handle_file()
  end

  defp handle_file({:ok, content}) do
    content
  end

  defp handle_file({:error, reason}) do
    {:error, "Error while opening the file"}
  end
end
