defmodule NewSigils do
  @doc """
  Create new sigil that reverses a string. Use `import NewSigils` first, even in iex.

  `~u(This sentence will be reversed.)`
  """
  def sigil_u(string, []) do
    String.reverse(string)
  end
end
