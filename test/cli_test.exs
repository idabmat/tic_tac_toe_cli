defmodule CliTest do
  use ExUnit.Case
  doctest Cli

  test "it starts a game when promted" do
    assert Cli.start_game() == :new_game
  end
end
