defmodule Cli.Grid do
  def cell(:computer), do: "O"
  def cell(:player1),  do: "X"
  def cell(_),         do: " "

  def display_row([]), do: "|\n"
  def display_row([h|t]) do
    "| #{cell(h)} " <> display_row(t)
  end

  def row_delimiter(), do: "|---+---+---|\n"

  def display_grid([]), do: row_delimiter()
  def display_grid([h|t]) do
    row_delimiter()
    <> display_row(h)
    <> display_grid(t)
  end
end
