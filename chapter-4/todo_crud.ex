defmodule TodoList do
  defstruct auto_id: 1, entries: HashDict.new

  def new(entries \\ []) do
    Enum.reduce(
      entries,
      %TodoList{},
      # Alternative to a λ: use capture operator with reversed args:
      # `&add_entry(&2, &1)`
      fn(entry, todo_list_acc) ->
        add_entry(todo_list_acc, entry)
      end
    )
  end

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

  @doc "This is update_entry/2. It calls update_entry/3."
  def update_entry(todo_list, %{} = new_entry) do
    update_entry(todo_list, new_entry.id, fn(_) -> new_entry end)
  end

  @doc "This is update_entry/3"
  def update_entry(
    %TodoList{entries: entries} = todo_list,
    entry_id,
    updater_fun
  ) do
    case entries[entry_id] do
      nil -> todo_list

      old_entry ->
        # Prevent ID from changing in the lambda.
        # Also use pattern matching to ensure that the λ returns a map.
        old_entry_id = old_entry.id
        new_entry = %{id: ^old_entry_id} = updater_fun.(old_entry)
        oldEntry_id = old_entry.id
        new_entries = HashDict.put(entries, new_entry.id, new_entry)
        %TodoList{todo_list | entries: new_entries}
    end
  end

  def delete_entry(
      %TodoList{entries: entries} = todo_list,
      entry_id
    ) do
      %TodoList{todo_list | entries: HashDict.delete(entries, entry_id)}
  end
end

# entries = [
#   %{date: {2013, 12, 19}, title: "dentist"},
#   %{date: {2013, 12, 20}, title: "shopping"},
#   %{date: {2013, 12, 19}, title: "movies"}
# ]

# todo_list = TodoList.new(entries)

# TodoList.entries(todo_list, {2013, 12, 19})

# updated_todo_list = TodoList.update_entry(
#   todo_list,
#   1,
#   &Map.put(&1, :date, {2013, 12, 20})
# )

# shortened_todo_list = TodoList.delete_entry(todo_list, 2)
