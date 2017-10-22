defmodule FakeEngine.Game do
  defstruct(
    winner: nil,
    current_player: nil,
    board: [
      [nil, nil, nil],
      [nil, nil, nil],
      [nil, nil, nil]
    ]
  )
end

defmodule FakeEngine do
  alias FakeEngine.Game

  def start_link() do
    Agent.start_link(fn -> {1, 1} end, name: __MODULE__)
  end

  def new_game, do: {:ok, 1}
  def game_state(1) do
    %Game{
      winner: nil,
      current_player: :player1,
    }
  end

  def player_move(1, _) do
    times_called = Agent.get_and_update(__MODULE__, fn {p1_state, cpu_state} ->
      {p1_state, {p1_state+1, cpu_state}}
    end)

    case times_called do
      1 -> %Game{
        winner: nil,
        current_player: :computer,
        board: [
          [nil, nil     , nil],
          [nil, :player1, nil],
          [nil, nil     , nil]
        ]
      }
      2 -> %Game{
        winner: nil,
        current_player: :computer,
        board: [
          [:computer, nil     , :player1],
          [nil      , :player1, nil     ],
          [nil      , nil     , nil     ]
        ]
      }
      3 -> %Game{
        winner: nil,
        current_player: :computer,
        board: [
          [:computer, nil     , :player1],
          [:player1 , :player1, nil     ],
          [:computer, nil     , nil     ]
        ]
      }
      4 -> %Game{
        winner: nil,
        current_player: :computer,
        board: [
          [:computer, nil     , :player1 ],
          [:player1 , :player1, :computer],
          [:computer, :player1, nil      ]
        ]
      }
      5 -> %Game{
        winner: :draw,
        current_player: :computer,
        board: [
          [:computer, :computer, :player1 ],
          [:player1 , :player1 , :computer],
          [:computer, :player1 , :player1 ]
        ]
      }
    end
  end

  def computer_move(1) do
    times_called = Agent.get_and_update(__MODULE__, fn {p1_state, cpu_state} ->
      {cpu_state, {p1_state, cpu_state+1}}
    end)

    case times_called do
      1 -> %Game{
        winner: nil,
        current_player: :player1,
        board: [
          [:computer, nil     , nil],
          [nil      , :player1, nil],
          [nil      , nil     , nil]
        ]
      }
      2 -> %Game{
        winner: nil,
        current_player: :player1,
        board: [
          [:computer, nil     , :player1],
          [nil      , :player1, nil     ],
          [:computer, nil     , nil     ]
        ]
      }
      3 -> %Game{
        winner: nil,
        current_player: :player1,
        board: [
          [:computer, nil     , :player1 ],
          [:player1 , :player1, :computer],
          [:computer, nil     , nil      ]
        ]
      }
      4 -> %Game{
        winner: nil,
        current_player: :player1,
        board: [
          [:computer, :computer, :player1 ],
          [:player1 , :player1 , :computer],
          [:computer, :player1 , nil      ]
        ]
      }
    end
  end

end
