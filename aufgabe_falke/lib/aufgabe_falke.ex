defmodule AufgabeFalke do
  @moduledoc """
  Documentation for AufgabeFalke.
  """

  @doc """
  Hello world.

  ## Examples

      iex> AufgabeFalke.hello()
      :world

  """

  def increment([], value) do 
    []
  end
  
  def increment(list, value) when is_list(list) and is_integer(value) do
    # One line solution
    #Enum.map(list,fn (x) -> x + value end)
    [first | rest] = list
    [first + value] ++ increment(rest, value)
  end
 
end
