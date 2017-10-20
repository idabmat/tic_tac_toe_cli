defmodule Cli.UiTest do
  use ExUnit.Case

  test "displays an empty grid" do
    Cli.Ui.display_grid() == """
     |_|_|_|
     |_|_|_|
     | | | |
    """
  end

end
