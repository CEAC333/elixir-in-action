defmodule Polymorphic do
  @moduledoc """
  Demonstrates a polymorphic function that does different things based on input type.
  """

  @doc """
  Doubles a number or a binary (string).
  """
  def double(x) when is_number(x) do
    2 * x
  end

  def double(x) when is_binary(x) do
    x <> x
  end
end
