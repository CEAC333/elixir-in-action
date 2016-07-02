defmodule NaturalNums do
  @moduledoc """
  Prints a list of the first _n_ natural numbers using recursion and pattern matching.
  """
  def print(1), do: IO.puts(1)

  def print(n) when is_integer(n) and n > 0 do
    print(n - 1)
    IO.puts(n)
  end
end
