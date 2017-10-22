defmodule Cli.Game do
  @engine Application.get_env(:cli, :tic_tac_toe)

  alias Cli.{Summary, Prompt}

  def start() do
    instructions()
    start_without_instructions()
  end

  defp start_without_instructions() do
    pid = new_game()
    game_state(pid) |> play(pid)
  end

  defp instructions() do
    IO.puts """

    Welcome to TicTacToe.

    On your turn to play, please enter the number of an empty cell.
    Cells are numbered as follows:

    |---+---+---|
    | 1 | 2 | 3 |
    |---+---+---|
    | 4 | 5 | 6 |
    |---+---+---|
    | 7 | 8 | 9 |
    |---+---+---|

    Let's begin ...
    """
  end

  defp new_game() do
    {:ok, pid} = @engine.new_game()
    pid
  end

  defp game_state(pid) do
    @engine.game_state(pid)
  end

  defp play(game_state = %@engine.Game{winner: nil, current_player: :computer}, pid) do
    Summary.display(game_state)
    @engine.computer_move(pid)
    |> play(pid)
  end

  defp play(game_state = %@engine.Game{winner: nil, current_player: :player1}, pid) do
    Summary.display(game_state)
    player_move = Prompt.get_player_move()
    @engine.player_move(pid, player_move)
    |> play(pid)
  end

  defp play(game_state, _) do
    Summary.display(game_state)
    Prompt.continue?()
    start_without_instructions()
  end

end
