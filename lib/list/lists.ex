defmodule Tutorials.Lists do
  # Sum all elements in a list
  def sum([]), do: 0
  def sum([h | t]), do: h + sum(t)

  # Sum all elements in a list recursively with an accumulator
  def sum_recursive(num, acc \\ 0)
  def sum_recursive([], acc), do: acc
  def sum_recursive([h | t], acc), do: sum_recursive(t, acc + h)

  # Reverse a list
  def reverse(elements, acc \\ [])
  def reverse([], acc), do: acc
  def reverse([h | t], acc), do: reverse(t, [h | acc])

  # Apply a function to each element in a list, returning a new list
  def map(element, func, acc \\ [])
  def map([], _, acc), do: acc |> reverse()
  def map([h | t], func, acc), do: map(t, func, [func.(h) | acc])

  # Concatenate two lists
  def concat(src, dst), do: concat_func(src |> reverse(), dst)

  # Helper function for concatenating two lists
  def concat_func([], dst), do: dst
  def concat_func([h | t], dst), do: concat_func(t, [h | dst])

  # Apply a function to each element in a list, flattening the result
  def flat_map(elements, func, acc \\ [])
  def flat_map([], _func, acc), do: acc
  def flat_map([h | t], func, acc), do: flat_map(t, func, concat(acc, func.(h)))
end
