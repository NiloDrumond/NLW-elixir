defmodule Wabanex.IMC do
  def calculate(filename) do
    filename
    |> File.read()
    |> handle_file()
  end

  defp handle_file({:ok, content}) do
    content
    |> String.split("\n")
    |> Enum.map(fn line -> parse_line(line) end)
  end

  defp handle_file({:error, _reason}) do
    {:error, "Error while opening the file"}
  end
end
