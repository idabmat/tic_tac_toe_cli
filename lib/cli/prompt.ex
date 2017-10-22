defmodule Cli.Prompt do

  def get_player_move(io \\ IO) do
    io.gets("Your move: ")
    |> valid_player_move?
  end

  def continue?(io \\ IO) do
    input = io.gets("Do you want to play another game? [Y/n] ")
    quit?(input == "n\n")
  end

  defp quit?(true) do
    IO.puts("Goodbye.")
    exit(:goodbye)
  end
  defp quit?(_), do: :continue

  defp valid_player_move?("\n"), do: valid_player_move?(:eof)
  defp valid_player_move?(:eof) do
    IO.puts("Looks like you gave up ...")
    exit(:gave_up)
  end

  defp valid_player_move?(input) do
    cond do
      input =~ ~r/\A[1-9]\n\z/ ->
        String.trim(input)
        |> String.to_integer
      true ->
        IO.puts("Invalid move.")
        get_player_move()
    end
  end

end
