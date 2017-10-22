defmodule Cli.PromptTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "recognized player move" do
    defmodule ValidMoveIO do
      def gets("Your move: "), do: "5\n"
    end

    assert Cli.Prompt.get_player_move(ValidMoveIO) == "5"
  end

  test "unrecognized player move" do
    defmodule InvalidMoveIO do
      def gets("Your move: "), do: "a\n"
    end

    captured_output = capture_io(fn ->
      try do
        Cli.Prompt.get_player_move(InvalidMoveIO)
      catch
        :exit, :gave_up -> "left"
      end
    end)

    assert String.contains?(captured_output, "Invalid move.")
  end

  test "Player gave up" do
    defmodule NoMoveIO do
      def gets("Your move: "), do: :eof
    end

    captured_output = capture_io(fn ->
      try do
        Cli.Prompt.get_player_move(NoMoveIO)
      catch
        :exit, :gave_up -> "left"
      end
    end)

    assert String.contains?(captured_output, "Looks like you gave up ...")
  end

  test "Player explicitely quits" do
    defmodule QuitIO do
      def gets("Do you want to play another game? [Y/n] "), do: "n\n"
    end

    captured_output = capture_io(fn ->
      try do
        Cli.Prompt.continue?(QuitIO)
      catch
        :exit, :goodbye -> "left"
      end
    end)

    assert String.contains?(captured_output, "Goodbye.")
  end

  test "Player does not explicitely quit" do
    defmodule NewGameIO do
      def gets("Do you want to play another game? [Y/n] "), do: "foo\n"
    end

    assert Cli.Prompt.continue?(NewGameIO) == :continue
  end

end
