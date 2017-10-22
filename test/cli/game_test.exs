defmodule Cli.GameTest do
  @engine Application.get_env(:cli, :tic_tac_toe)

  use ExUnit.Case
  import ExUnit.CaptureIO

  setup do
    @engine.start_link()
    :ok
  end

  test "starting a game shows the game instructions" do
    grid_instructions = """
    |---+---+---|
    | 1 | 2 | 3 |
    |---+---+---|
    | 4 | 5 | 6 |
    |---+---+---|
    | 7 | 8 | 9 |
    |---+---+---|
    """

    captured_output = capture_io(fn ->
      try do
        Cli.Game.start()
      catch
        :exit, _ -> "no input"
      end
    end)

    assert String.contains?(captured_output, grid_instructions)
  end

  test "player makes a move, then ai makes a move" do
    captured_output = capture_io("5\n", fn ->
      try do
        Cli.Game.start()
      catch
        :exit, _ -> "no input"
      end
    end)

    expected_grid = """
    |---+---+---|
    | O |   |   |
    |---+---+---|
    |   | X |   |
    |---+---+---|
    |   |   |   |
    |---+---+---|
    """

    assert String.contains?(captured_output, expected_grid)
  end
end
