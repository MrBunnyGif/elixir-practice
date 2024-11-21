defmodule Tutorials.Lists do
  @moduledoc """
  Documentation for Tutorials.Lists.
  """

  @doc """
  Sums the elements of a list using recursion.

  ## Examples

      iex> Tutorials.Lists.sum([1, 2, 3])
      6

  """
  def sum([]), do: 0

  def sum([h | t]) do
    h + sum(t)
  end

  @doc """
  Sums the elements of a list using recursion.

  ## Examples

      iex> Tutorials.Lists.sum([1, 2, 3])
      6

  """
  @spec sum_recursive([integer]) :: integer
  def sum_recursive(num, acc \\ 0)
  def sum_recursive([], acc), do: acc

  def sum_recursive([h | t], acc) do
    sum_recursive(t, acc + h)
  end
end
