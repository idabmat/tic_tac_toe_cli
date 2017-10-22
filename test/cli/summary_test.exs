defmodule Cli.SummaryTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

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

    captured_output = capture_io(fn ->
      Cli.Summary.display(state)
    end)

    assert captured_output == """
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
