defmodule Tutorials.Structs.Expense do
  alias Tutorials.Structs.Expense

  defstruct(
    title: "",
    date: nil,
    amount: 0,
    store: ""
  )

  @type t :: %Expense{
          title: String.t(),
          date: Date.t() | nil,
          amount: integer(),
          store: String.t()
        }

  @spec sample() :: [t()]
  def sample do
    [
      %Expense{title: "Grocery", date: ~D[2023-01-01], amount: 100, store: "Amazon"},
      %Expense{title: "Dinner", date: ~D[2023-01-02], amount: 50, store: "Restaurant"},
      %Expense{title: "Shirt", date: ~D[2023-01-03], amount: 20, store: "Macy's"},
      %Expense{title: "Phone bill", date: ~D[2023-01-04], amount: 30, store: "Verizon"},
      %Expense{title: "Car insurance", date: ~D[2023-01-05], amount: 150, store: "State Farm"},
      %Expense{title: "Books", date: ~D[2023-01-06], amount: 40, store: "Amazon"}
    ]
  end

  @spec total([t()]) :: number()
  def total(expenses) do
    expenses |> Enum.reduce(0, fn expense, acc -> expense.amount + acc end)
  end

  @spec sort_by_date([t()]) :: [t()]
  def sort_by_date(expenses) do
    expenses |> Enum.sort_by(& &1.date, :desc)
  end
end
