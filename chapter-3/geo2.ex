defmodule Geo2 do
  @pi 3.1415926535

  def area({:rectangle, a, b}) do
    a * b
  end

  def area({:square, a}) do
    a * a
  end

  def area({:circle, r}) do
    @pi * r * r
  end

  def area(unknown) do
    {:error, {:unknown_shape, unknown}}
  end
end
