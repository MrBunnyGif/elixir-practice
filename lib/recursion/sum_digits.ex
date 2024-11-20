defmodule Tutorials.Recursion.SumDigits do
  def upto(0), do: 0

  def upto(num) do
    num + upto(num - 1)
  end

  def upto_tail(0, acc \\ 0), do: acc

  def upto_tail(num, acc) do
    upto_tail(num - 1, acc + num)
  end
end
