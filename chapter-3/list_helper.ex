defmodule ListHelper do
  @moduledoc """
  Sum a list using (non-tco) recursion.
  """
  def sum([]), do: 0

  def sum([head | tail]) do
    head + sum(tail)
  end
end
