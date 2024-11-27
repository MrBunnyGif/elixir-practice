defmodule Training.CountingWords do
  def count(sentence) do
    sentence
    # Normaliza para minúsculas
    |> String.downcase()
    # Divide por qualquer caractere que não seja palavra
    |> String.split(~r/\W+/)
    # Remove strings vazias
    |> Enum.filter(&(&1 != ""))
    |> Enum.reduce(%{}, fn word, acc ->
      # Incrementa a contagem da palavra
      Map.update(acc, word, 1, &(&1 + 1))
    end)
  end
end
