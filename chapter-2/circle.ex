defmodule Circle do
  @moduledoc "Implements basic circle function."

  @pi 3.1415926535

  @doc "Computes the area of a circle."
  @spec area(number) :: number
  def area(r), do: r*r*@pi

  @doc "Computes the circumference of a circle."
  @spec circumference(number) :: number
  def circumference(r), do: 2*r*@pi
end
