defmodule Training.DoubleEven do
  def double_even(nums) do
    onlyDoubles = nums |> Enum.filter(fn n -> rem(n, 2) == 0 end)
    onlyDoubles |> Enum.reduce(0, fn n, acc -> n * 3 + acc end)
  end
end

### Melhoria do chatgpt:

defmodule Training.DoubleEven_GPT do
  def double_even_GPT(nums) do
    nums
    |> Enum.filter(&(rem(&1, 2) == 0))
    |> Enum.reduce(0, fn n, acc -> n * 3 + acc end)
  end
end
