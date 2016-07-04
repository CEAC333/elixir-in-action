defmodule TodoList do
  defstruct auto_id: 1, entries: HashDict.new

  def new, do: %TodoList{}

  def add_entry(
    %TodoList{entries: entries, auto_id: auto_id} = todo_list, entry
  ) do
    entry = Map.put(entry, :id, auto_id)
    new_entries = HashDict.put(entries, auto_id, entry)

    # Update the struct
    %TodoList{todo_list |
      entries: new_entries,
      auto_id: auto_id + 1
    }
  end

  def entries(%TodoList{entries: entries}, date) do
    entries
    |> Stream.filter(fn({_, entry}) ->
        entry.date == date
      end)
    |> Enum.map(fn({_, entry}) ->
         entry
      end)
  end

  def update_entry(
    %TodoList{entries: entries} = todo_list,
    entry_id,
    updater_fun
  ) do
    case entries[entry_id] do
      nil -> todo_list

      old_entry ->
        new_entry = updater_fun.(old_entry)
        new_entries = HashDict.puy(entries, new_entry.id, new_entry)
        %TodoList{todo_list | entries: new_entries}
    end
  end
end


# Interactive Elixir (1.3.1) - press Ctrl+C to exit (type h() ENTER for help)
# iex(1)> tl = TodoList.new |>
# ...(1)>   TodoList.add_entry(
# ...(1)>     %{date: {2013, 12, 19}, title: "dentist"}
# ...(1)>   ) |>
# ...(1)>   TodoList.add_entry(
# ...(1)>      %{date: {2013, 12, 20}, title: "shopping"}
# ...(1)>   ) |>
# ...(1)>   TodoList.add_entry(
# ...(1)>     %{date: {2013, 12, 19}, title: "movies"}
# ...(1)>   )
# %TodoList{auto_id: 4,
#  entries: #HashDict<[{2, %{date: {2013, 12, 20}, id: 2, title: "shopping"}},
#   {3, %{date: {2013, 12, 19}, id: 3, title: "movies"}},
#   {1, %{date: {2013, 12, 19}, id: 1, title: "dentist"}}]>}
# iex(2)> TodoList.entries(tl
# tl/1
# iex(2)> TodoList.entries(tl, {2013, 12, 19})
# [%{date: {2013, 12, 19}, id: 3, title: "movies"},
#  %{date: {2013, 12, 19}, id: 1, title: "dentist"}]
# iex(3)>
