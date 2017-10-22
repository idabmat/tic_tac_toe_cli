defmodule Cli do
  use Application

  def start(_type, _args) do
    start_game()
  end

  def start_game() do
    Cli.Game.start()
  end
end
