defmodule Tutorials.Structs.SevenWonders do
  defstruct name: "", country: ""
  alias Tutorials.Structs.SevenWonders

  @type t :: %SevenWonders{
          name: String.t(),
          country: String.t()
        }

  @spec all() :: [t()]
  def all() do
    [
      %SevenWonders{name: "The Great Wall of China", country: "China"},
      %SevenWonders{name: "The Taj Mahal", country: "India"},
      %SevenWonders{name: "Machu Picchu", country: "Peru"},
      %SevenWonders{name: "Chich n Itz ", country: "Mexico"},
      %SevenWonders{name: "The Roman Colosseum", country: "Italy"},
      %SevenWonders{name: "The Christ the Redeemer statue", country: "Brazil"},
      %SevenWonders{name: "The Pyramids of Giza", country: "Egypt"}
    ]
  end

  @spec print_names([t()]) :: :ok
  def print_names(wonders) do
    wonders
    |> Enum.each(fn %{name: name} -> IO.puts(name) end)
  end

  @spec filter_by_country([t()], String.t()) :: [t()]
  def filter_by_country(wonders, countryReceived) do
    wonders
    |> Enum.filter(fn %{country: country} -> country == countryReceived end)
  end

  @spec country_starting_with_i([t()]) :: [t()]
  def country_starting_with_i(wonders) do
    wonders |> Enum.filter(fn %{country: country} -> String.starts_with?(country, "I") end)
  end

  def sort_by_country_length(wonders) do
    wonders |> Enum.sort(fn x, y -> String.length(x.country) < String.length(y.country) end)
  end

  def name_country_list(wonders) do
    wonders |> Enum.reduce([], fn wonder, acc -> [[wonder.name, wonder.country] | acc] end)
    #    wonders |> Enum.flat_map(fn wonder -> [wonder.name, wonder.country] end)
    # mesmo resultado mas com map
  end

  def country_keyword_list(wonders) do
    wonders
    |> Enum.reduce([], fn wonder, acc -> [{String.to_atom(wonder.name), wonder.country} | acc] end)
  end
end
