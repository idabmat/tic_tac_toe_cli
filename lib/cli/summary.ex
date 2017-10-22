defmodule Cli.Summary do

  def display(%TicTacToe.Game{board: board, current_player: current_player}) do
    board(board)
    <> "\n"
    <> current_player(current_player)
    <> "\n"
  end

  defp board([]), do: row_delimiter()
  defp board([h|t]) do
    row_delimiter()
    <> row(h)
    <> board(t)
  end

  defp current_player(:computer), do: "My turn."
  defp current_player(:player1),  do: "Your turn."

  defp row_delimiter(), do: "|---+---+---|\n"

  defp row([]),    do: "|\n"
  defp row([h|t]), do: "| #{cell(h)} " <> row(t)

  defp cell(:computer), do: "O"
  defp cell(:player1),  do: "X"
  defp cell(_),         do: " "

end
