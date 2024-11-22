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
end
