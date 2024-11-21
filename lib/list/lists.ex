defmodule Tutorials.Lists do
  def sum([]), do: 0

  def sum([h | t]) do
    h + sum(t)
  end

  def sum_recursive(num, acc \\ 0)
  def sum_recursive([], acc), do: acc

  def sum_recursive([h | t], acc) do
    sum_recursive(t, acc + h)
  end

  def reverse(elements, acc \\ [])
  def reverse([], acc), do: acc

  def reverse([h | t], acc) do
    reverse(t, [h | acc])
  end

  def map(element, func, acc \\ [])
  def map([], _, acc), do: acc |> reverse()
  def map([h | t], func, acc), do: map(t, func, [func.(h) | acc])
end
