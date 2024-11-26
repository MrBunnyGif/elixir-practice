defmodule Training.FizzBuzz do
  def fizz_buzz(num, acc \\ [])
  def fizz_buzz(0, acc), do: acc

  def fizz_buzz(num, acc) do
    fizz_buzz(num - 1, [check_multiples(num) | acc])
  end

  def check_multiples(num) do
    case rem(num, 15) do
      0 ->
        "fizzbuzz"

      _ ->
        case rem(num, 5) do
          0 ->
            "buzz"

          _ ->
            case rem(num, 3) do
              0 -> "fizz"
              _ -> num
            end
        end
    end
  end
end

### Melhoria do chatgpt:

defmodule Training.FizzBuzz_GPT do
  def fizz_buzz_GPT(n) do
    1..n
    |> Enum.map(&check_multiples_GPT/1)
  end

  defp check_multiples_GPT(num) do
    cond do
      rem(num, 15) == 0 -> "fizzbuzz"
      rem(num, 3) == 0 -> "fizz"
      rem(num, 5) == 0 -> "buzz"
      true -> num
    end
  end
end
