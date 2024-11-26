defmodule Training.Palindrome do
  def palindrome(string_value),
    do:
      string_value |> String.reverse() |> String.downcase() |> String.replace(" ", "") ==
        string_value |> String.downcase() |> String.replace(" ", "")
end

### Melhoria do chatgpt:

defmodule Training.Palindrome_GPT do
  def palindrome_GPT(string_value) do
    sanitized = sanitize_string_GPT(string_value)
    sanitized == String.reverse(sanitized)
  end

  defp sanitize_string_GPT(string) do
    string
    |> String.downcase()
    # Remove espaços
    |> String.replace(~r/\s+/, "")
    # Remove pontuações e mantém letras/números (unicode-safe)
    |> String.replace(~r/[^\w]/u, "")
  end
end
