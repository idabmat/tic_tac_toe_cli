defmodule Cli.UiTest do
  use ExUnit.Case

  test "displays an empty grid" do
    assert Cli.Ui.display_grid() == """
             |            |
             |            |
             |            |
             |            |
             |            |
             |            |
             |            |
_____________|____________|_______________
             |            |
             |            |
             |            |
             |            |
             |            |
             |            |
_____________|____________|_______________
             |            |
             |            |
             |            |
             |            |
             |            |
             |            |
             |            |
    """
  end

end
