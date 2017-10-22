defmodule Cli.GridTest do
  use ExUnit.Case
  alias Cli.Grid

  test "can display an O in a cell" do
    assert Grid.cell(:computer) == "O"
  end

  test "can display an X in a cell" do
    assert Grid.cell(:player1) == "X"
  end

  test "can display empty cell" do
    assert Grid.cell(nil) == " "
  end

  test "can display a row" do
    row = [:player1, nil, :computer]
    assert Grid.display_row(row) == "| X |   | O |\n"
  end

  test "can display a full grid" do
    board = [
      [:player1, :computer, :player1],
      [:computer, :computer, :player1],
      [:player1, :computer, :player1]
    ]
    assert Grid.display_grid(board) == """
    |---+---+---|
    | X | O | X |
    |---+---+---|
    | O | O | X |
    |---+---+---|
    | X | O | X |
    |---+---+---|
    """
  end

  test "displays an empty grid" do
    board = [
      [nil, nil, nil],
      [nil, nil, nil],
      [nil, nil, nil]
    ]
    assert Grid.display_grid(board) == """
    |---+---+---|
    |   |   |   |
    |---+---+---|
    |   |   |   |
    |---+---+---|
    |   |   |   |
    |---+---+---|
    """
  end
end
