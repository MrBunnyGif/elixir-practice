defmodule Tutorials.Lists do
  def sum_simple([]), do: 0

  def sum_simple([h | t]) do
    h + sum_simple(t)
  end

  def sum_recursive(num, acc \\ 0)
  def sum_recursive([], acc), do: acc

  def sum_recursive([h | t], acc) do
    sum_recursive(t, acc + h)
  end
end
