defmodule Cli.Summary do
  @engine Application.get_env(:cli, :tic_tac_toe)

  def display(%@engine.Game{board: board, current_player: current_player, winner: winner}) do
    "\n"
    <> board(board)
    <> "\n"
    <> status_line(winner, current_player)
    |> IO.puts
  end

  defp board([]), do: row_delimiter()
  defp board([h|t]) do
    row_delimiter()
    <> row(h)
    <> board(t)
  end

  defp row_delimiter(), do: "|---+---+---|\n"

  defp row([]),    do: "|\n"
  defp row([h|t]), do: "| #{cell(h)} " <> row(t)

  defp cell(:computer), do: "O"
  defp cell(:player1),  do: "X"
  defp cell(_),         do: " "

  defp status_line(nil, player),  do: current_player(player)
  defp status_line(winner, _),    do: announce_winner(winner)

  defp current_player(:computer), do: "My turn."
  defp current_player(:player1),  do: "Your turn."

  defp announce_winner(:computer), do: "You lost."
  defp announce_winner(:draw),     do: "It's a tie."
  defp announce_winner(:player1),  do: "You won."

end
