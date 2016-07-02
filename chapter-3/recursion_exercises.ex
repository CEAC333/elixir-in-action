defmodule RecursionExercises do
  @moduledoc """
  Recursion practice from page 90
  """

  @doc """
  Count the number of items in a list
  """
  def list_len(list) do
    process_list(0, list)
  end

  defp process_list(len, []), do: len

  defp process_list(len, [_|tail]) do
    new_len = len + 1
    process_list(new_len, tail)
  end

  @doc """
  Take two integers, from and to, and return a list of that range. `create_range` will proceed backwards and cons the current_item to the list.
  """
  def range(from, to) when from < to and is_integer(from) and is_integer(to) do
    create_range([], from, to)
  end

  defp create_range(list, from, current_item) when current_item === from do
    [from|list]
  end

  defp create_range(list, from, current_item) do
    new_list = [current_item|list]
    create_range(new_list, from, current_item-1)
  end

  @doc """
  Take a list and return only positive numbers from the input list.
  """
  def positive(list) do
    filter_positives([], list)
    |> reverse_list([])
  end

  defp filter_positives(filtered, []), do: filtered

  defp filter_positives(filtered, [head|tail]) do
    if head > 0 do
      filter_positives([head|filtered], tail)
    else
      filter_positives(filtered, tail)
    end
  end

  defp reverse_list([], reversed) do
    reversed
  end

  defp reverse_list(orig, reversed) do
    [head|tail] = orig
    new_list = ([head|reversed])
    reverse_list(tail, new_list)
  end

end
