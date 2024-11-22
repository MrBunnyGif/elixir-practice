defmodule Tutorials.Structs.SevenWonders do
  # This is a struct representing a Seven Wonders of the World
  defstruct name: "", country: ""
  alias Tutorials.Structs.SevenWonders

  # This is a type representing a Seven Wonders of the World
  @type t :: %SevenWonders{
          name: String.t(),
          country: String.t()
        }

  # This function returns a list of all Seven Wonders of the World
  @spec all() :: [t()]
  def all() do
    # This is a list of all Seven Wonders of the World
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

  # This function prints all the names in a list of Seven Wonders
  @spec print_names([t()]) :: :ok
  def print_names(wonders) do
    # This is where we use the Enum.each function to loop through the list and print the names
    wonders
    |> Enum.each(fn %{name: name} -> IO.puts(name) end)
  end

  # This function takes a list of Seven Wonders and a country, and returns a list of all the
  # Seven Wonders in that country
  @spec filter_by_country([t()], String.t()) :: [t()]
  def filter_by_country(wonders, countryReceived) do
    # This is where we use the Enum.filter function to loop through the list and filter out the
    # Seven Wonders that are not in the given country
    wonders
    |> Enum.filter(fn %{country: country} -> country == countryReceived end)
  end

  # This function takes a list of Seven Wonders and returns a list of all the Seven Wonders
  # whose country starts with "I"
  @spec country_starting_with_i([t()]) :: [t()]
  def country_starting_with_i(wonders) do
    # This is where we use the Enum.filter function to loop through the list and filter out the
    # Seven Wonders whose country starts with "I"
    wonders |> Enum.filter(fn %{country: country} -> String.starts_with?(country, "I") end)
  end

  # This function takes a list of Seven Wonders and returns a list sorted by the length of the
  # country name
  def sort_by_country_length(wonders) do
    # This is where we use the Enum.sort function to loop through the list and sort the Seven
    # Wonders by the length of the country name
    wonders |> Enum.sort(fn x, y -> String.length(x.country) < String.length(y.country) end)
  end

  # This function takes a list of Seven Wonders and returns a list of all the names and
  # countries
  def name_country_list(wonders) do
    # This is where we use the Enum.reduce function to loop through the list and create a new
    # list with the names and countries
    wonders |> Enum.reduce([], fn wonder, acc -> [[wonder.name, wonder.country] | acc] end)
    #    wonders |> Enum.flat_map(fn wonder -> [wonder.name, wonder.country] end)
    # mesmo resultado mas com map
  end

  # This function takes a list of Seven Wonders and returns a list of all the names and
  # countries, where the names are atoms
  def country_keyword_list(wonders) do
    # This is where we use the Enum.reduce function to loop through the list and create a new
    # list with the names and countries, where the names are atoms
    wonders
    |> Enum.reduce([], fn wonder, acc -> [{String.to_atom(wonder.name), wonder.country} | acc] end)
  end

  # This function takes a list of Seven Wonders and returns a list of all the names
  def all_names(wonders) do
    # This is where we use the for comprehension to loop through the list and create a new
    # list with the names
    for %{name: name} <- wonders, do: name
  end
end
