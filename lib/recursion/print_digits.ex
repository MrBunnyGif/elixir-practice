defmodule Tutorials.Recursion.PrintDigits do
  def upto(0) do
    0
  end

  def upto(nums) do
    nums + upto(nums - 1)
    IO.puts(nums)
  end
end
