defmodule Tutorials.Recursion.Factorial do
  def of(1), do: 1

  def of(num) do
    num * of(num - 1)
  end
end
