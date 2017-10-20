defmodule CliTest do
  use ExUnit.Case
  doctest Cli

  test "it starts a game when promted" do
    assert Cli.start_game() == :new_game
  end

  test "it can make a move" do
    assert Cli.make_move(5) == :new_game_state
  end
end
