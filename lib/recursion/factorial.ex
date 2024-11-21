defmodule Tutorials.Recursion.Factorial do
  def of(1, acc), do: acc

  def of(num, acc \\ 1) do
    of(num - 1, acc * num)
  end
end
