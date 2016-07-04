defmodule RecursionExercises do
  @moduledoc """
  Recursion practice from page 90. All of these are tail recursive.
  """

  @doc """
  Count the number of items in a list
  """
  def list_len(list) do
    process_list(list, 0)
  end

  defp process_list([], len), do: len

  defp process_list([_|tail], len) do
    process_list(tail, len + 1)
  end

  @doc """
  Take two integers, from and to, and return a list of that range. `create_range` will proceed backwards and cons the current_item to the list.
  """
  def range(from, to) when from < to and is_integer(from) and is_integer(to) do
    create_range(from, to, [])
  end

  defp create_range(from, current_item, list) when current_item === from do
    [from|list]
  end

  defp create_range(from, current_item, list) do
    create_range(from, current_item - 1, [current_item|list])
  end

  @doc """
  Take a list and return only positive numbers from the input list.
  """
  def positive(list) do
    filter_positives(list, [])
    |> reverse_list([])
  end

  defp filter_positives([], filtered), do: filtered

  defp filter_positives([head|tail], filtered) do
    if head > 0 do
      filter_positives(tail, [head|filtered])
    else
      filter_positives(tail, filtered)
    end
  end

  # An exercise, instead of using Enum.reverse/1
  defp reverse_list([], reversed) do
    reversed
  end

  defp reverse_list(orig, reversed) do
    [head|tail] = orig
    reverse_list(tail, [head|reversed])
  end

end
