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
____________|____________|____________
            |            |
            |            |
            |            |
            |            |
            |            |
            |            |
____________|____________|____________
            |            |
            |            |
            |            |
            |            |
            |            |
            |            |
            |            |
    """
  end

  test "can display an X in a cell" do
    assert Cli.Ui.cell(:computer) == """

    ____
  ,' __ `.
 / ,'  `. \
 | | () | |
 \ `.__,' /
  `.____,'

    """
  end

end
