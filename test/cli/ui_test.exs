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

  test "can display an O in a cell" do
    assert Cli.Ui.cell(:computer) == """
    ____    
  ,' __ `.  
 / ,'  `. \ 
 | | () | | 
 \ `.__,' / 
  `.____,'  
    """
  end

  test "can display an X in a cell" do
    assert Cli.Ui.cell(:player1) == """
   .____,   
  . \  / ,  
  |`-  -'|  
  |,-  -.|  
  ' /__\ `  
   '    `   
    """
  end

  test "can display empty cell" do
    assert Cli.Ui.cell(nil) == """
            
            
            
            
            
            
    """
  end
  
  test "can display a full grid" do
    board = [
      [:player1, :computer, :player1],
      [:computer, :computer, :player1],
      [:player1, :computer, :player1]
    ]
    assert Cli.Ui.display_grid(board) == """
   .____,   |    ____    |   .____,   
  . \  / ,  |  ,' __ `.  |  . \  / ,  
  |`-  -'|  | / ,'  `. \ |  |`-  -'|  
  |,-  -.|  | | | () | | |  |,-  -.|  
  ' /__\ `  | \ `.__,' / |  ' /__\ `  
   '    `   |  `.____,'  |   '    `   
____________|____________|____________
    ____    |    ____    |   .____,   
  ,' __ `.  |  ,' __ `.  |  . \  / ,  
 / ,'  `. \ | / ,'  `. \ |  |`-  -'|  
 | | () | | | | | () | | |  |,-  -.|  
 \ `.__,' / | \ `.__,' / |  ' /__\ `  
  `.____,'  |  `.____,'  |   '    `   
____________|____________|____________
   .____,   |    ____    |   .____,   
  . \  / ,  |  ,' __ `.  |  . \  / ,  
  |`-  -'|  | / ,'  `. \ |  |`-  -'|  
  |,-  -.|  | | | () | | |  |,-  -.|  
  ' /__\ `  | \ `.__,' / |  ' /__\ `  
   '    `   |  `.____,'  |   '    `   
    """
  end
end
