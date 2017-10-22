defmodule Cli.SummaryTest do
  use ExUnit.Case
  alias Cli.Summary

  test "display the game summary" do
    state = %TicTacToe.Game{
      current_player: :player1,
      board: [
        [:player1 , :computer, :player1],
        [:computer, nil      , nil     ],
        [:player1 , :computer, :player1]
      ],
      winner: nil
    }

    assert Summary.display(state) == """
    |---+---+---|
    | X | O | X |
    |---+---+---|
    | O |   |   |
    |---+---+---|
    | X | O | X |
    |---+---+---|

    Your turn.
    """
  end
end
