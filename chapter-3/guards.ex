defmodule Guards do
  @doc """
  Named function that tests whether a number is positive or negative.
  """
  def test_num(n) when is_number(n) and n < 0 do
    :negative
  end

  def test_num(0) do
    :zero
  end

  def test_num(n) when is_number(n) do
    :positive
  end

  # Anon function that tests whether a number is
  # positive or negative. This can only be run by
  # pasting into iex?
  test_num2 = fn
    x when is_number(x) and x < 0 ->
      :negative

    0 ->
      :zero

    x when is_number(x) and x > 0 ->
      :positive
  end
end
