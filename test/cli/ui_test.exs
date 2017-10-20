defmodule Cli.UiTest do
  use ExUnit.Case

  test "can display an O in a cell" do
    assert Cli.Ui.cell(:computer) == "O"
  end

  test "can display an X in a cell" do
    assert Cli.Ui.cell(:player1) == "X"
  end

  test "can display empty cell" do
    assert Cli.Ui.cell(nil) == " "
  end

  test "can display a row" do
    row = [:player1, nil, :computer]
    assert Cli.Ui.display_row(row) == "| X |   | O |\n"
  end

  test "can display a full grid" do
    board = [
      [:player1, :computer, :player1],
      [:computer, :computer, :player1],
      [:player1, :computer, :player1]
    ]
    assert Cli.Ui.display_grid(board) == """
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
    assert Cli.Ui.display_grid(board) == """
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
