defmodule Fact do
  @moduledoc """
  Factorial
  """

  def fact(0), do: 1
  def fact(n), do: n * fact(n - 1)
end
