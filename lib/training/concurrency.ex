defmodule Training.Concurrency do
  def square(nums) do
    nums |> Enum.map(&(&1 ** 2))
  end
end

### Melhoria do chatgpt com concorrência:

defmodule Training.Concurrency_GPT do
  def square_GPT(nums) do
    nums
    |> Enum.map(fn num ->
      Task.async(fn -> num ** 2 end)
    end)
    |> Enum.map(&Task.await/1)
  end
end
