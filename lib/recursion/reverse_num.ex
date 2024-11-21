defmodule Tutorials.Recursion.ReverseNum do
  def reverse(0, acc), do: acc

  def reverse(num, acc \\ 0) do
    reverse(div(num, 10), acc * 10 + rem(num, 10))
    # 12 03
    # 01 32
    # 00 321
  end
end
