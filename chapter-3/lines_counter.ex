defmodule LinesCounter do
  @moduledoc """
  Reads a file, counts lines, handles errors.
  """
  def count(path) do
    File.read(path)
    |> lines_num
  end

  defp lines_num({:ok, contents}) do
    contents
    |> String.split("\n")  # String.split/2
    |> length
  end

  defp lines_num(error), do: error
end
