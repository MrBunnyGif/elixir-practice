defmodule Tutorials.Recursion.PrintDigits do
  def upto(0) do
    :ok
  end

  # Tail recursion
  def upto(nums) do
    # PRINTA DE 3 ATÉ 0
    IO.puts(nums)
    upto(nums - 1)
  end

  # Head recursion
  #  def upto(nums) do
  # INVERTENDO O PRINT E A CHAMADA, TEM-SE A CONTAGEM DE AO CONTRÁRIO
  # upto(nums - 1)
  # IO.puts(nums)
  # end
end
