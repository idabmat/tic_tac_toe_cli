defmodule Cli.SummaryTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "game in progress summary" do
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

  test "computer won" do
    state = %TicTacToe.Game{
      current_player: :player1,
      board: [
        [:player1 , :player1 , nil      ],
        [:computer, :computer, :computer],
        [:player1 , :computer, :player1 ]
      ],
      winner: :computer
    }

    captured_output = capture_io(fn ->
      Cli.Summary.display(state)
    end)

    assert captured_output == """

    |---+---+---|
    | X | X |   |
    |---+---+---|
    | O | O | O |
    |---+---+---|
    | X | O | X |
    |---+---+---|

    You lost.
    """
  end

  test "a tie" do
    state = %TicTacToe.Game{
      current_player: :computer,
      board: [
        [:player1 , :player1 , :computer ],
        [:computer, :computer, :player1  ],
        [:player1 , :computer, :player1  ]
      ],
      winner: :draw
    }

    captured_output = capture_io(fn ->
      Cli.Summary.display(state)
    end)

    assert captured_output == """

    |---+---+---|
    | X | X | O |
    |---+---+---|
    | O | O | X |
    |---+---+---|
    | X | O | X |
    |---+---+---|

    It's a tie.
    """
  end

  test "player won" do
    state = %TicTacToe.Game{
      current_player: :computer,
      board: [
        [:player1 , :computer, :computer ],
        [:computer, :player1 , :player1  ],
        [:player1 , :computer, :player1  ]
      ],
      winner: :player1
    }

    captured_output = capture_io(fn ->
      Cli.Summary.display(state)
    end)

    assert captured_output == """

    |---+---+---|
    | X | O | O |
    |---+---+---|
    | O | X | X |
    |---+---+---|
    | X | O | X |
    |---+---+---|

    You won.
    """
  end
end
