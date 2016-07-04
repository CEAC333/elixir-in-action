defmodule StreamExamples do

  @doc """
  Read a file and return a list of lines that are more than 80 characters long.

  Uses streams in order to avoid loading the entire file at once.
  """
  def large_lines!(path) do
    File.stream!(path)
    |> Stream.map(&String.replace(&1, "\n", ""))
    |> Enum.filter(&(String.length(&1) > 80))
  end

end
