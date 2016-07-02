defmodule ClassicalBranching do
  @moduledoc """
  Implement a `max` function with various classical branching constructs.
  """

  @doc "if/else"
  def max_if(a, b) do
    if a >= b, do: a, else: b
  end

  @doc "unless"
  def max_unless(a, b) do
    unless a >= b, do: b, else: a
  end

  @doc "cond"
  def max_cond(a, b) do
    cond do
      a >= b -> a
      true -> b
    end
  end

  @doc "`case` uses pattern matching."
  def max_case(a, b) do
    case a >= b do
      true -> a
      false -> b
    end
  end
end
