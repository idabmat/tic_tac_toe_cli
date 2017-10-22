defmodule Cli.SummaryTest do
  use ExUnit.Case
  alias Cli.Summary

  test "can display the current board" do
    board = [
      [:player1, :computer, :player1],
      [:computer, nil, nil],
      [:player1, :computer, :player1]
    ]
    assert Summary.board(board) == """
    |---+---+---|
    | X | O | X |
    |---+---+---|
    | O |   |   |
    |---+---+---|
    | X | O | X |
    |---+---+---|
    """
  end
end
