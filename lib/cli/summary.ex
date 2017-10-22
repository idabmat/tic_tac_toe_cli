defmodule Cli.Summary do
  def board([]), do: row_delimiter()
  def board([h|t]) do
    row_delimiter()
    <> row(h)
    <> board(t)
  end

  defp cell(:computer), do: "O"
  defp cell(:player1),  do: "X"
  defp cell(_),         do: " "

  defp row([]), do: "|\n"
  defp row([h|t]) do
    "| #{cell(h)} " <> row(t)
  end

  defp row_delimiter(), do: "|---+---+---|\n"
end
