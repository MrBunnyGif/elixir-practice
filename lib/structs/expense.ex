defmodule Tutorials.Structs.Expense do
  @moduledoc """
  This module contains the Expense struct definition as well as a few functions
  for creating and manipulating a list of expenses.
  """

  alias Tutorials.Structs.Expense

  @typedoc """
  This is the type definition for the Expense struct.
  """
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

  @doc """
  This function returns a list of sample expenses.
  """
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

  @doc """
  This function takes a list of expenses and returns the total of all amounts.
  """
  @spec total([t()]) :: number()
  def total(expenses) do
    expenses |> Enum.reduce(0, fn expense, acc -> expense.amount + acc end)
  end

  @doc """
  This function takes a list of expenses and returns a new list sorted by the date
  in descending order.
  """
  @spec sort_by_date([t()]) :: [t()]
  def sort_by_date(expenses) do
    expenses |> Enum.sort_by(& &1.date, :desc)
  end

  @doc """
  This function takes an expense and adds it to the list of sample expenses.
  """
  @spec add_expense(t) :: [t()]
  # checking the type
  def add_expense(%Expense{} = expense) do
    [expense | sample()]
  end

  @doc """
  This function takes a title and an amount, and updates the expense with that title
  to have the new amount.
  """
  def update_amount(title, amount) do
    [item] = Enum.filter(sample(), fn %{title: expense_title} -> expense_title == title end)
    new_item = %{item | amount: amount}
    [new_item | sample() |> List.delete(item)]
  end

  @users ["user1", "user2", "user3"]
  @doc """
  This function authenticates a user.
  """
  def authenticate(user) when user in @users, do: {:ok, "Authenticated"}
  def authenticate(_), do: {:error, "Unauthorized"}

  @doc """
  This function verifies a password for a user.
  """
  def verify_password(user, _password) when user in @users, do: {:ok, "Password verified"}
  def verify_password(_user, _password), do: {:error, "Wrong password"}

  @doc """
  This function logs a user in with a password.
  """
  def login(user, password) do
    with {:ok, _auth_msg} <- authenticate(user),
         {:ok, _auth_msg} =
           verify_password(user, password) do
      {:ok, "#{user} Login successful"}
    else
      {:error, msg} -> {:error, msg}
      _ -> :unauthorized
    end
  end
end
