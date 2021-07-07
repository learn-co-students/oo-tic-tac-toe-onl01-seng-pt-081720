require 'pry'

class TicTacToe
  
  def initialize
    @board = Array.new(9, " ")
  end 
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [0,3,6],
    [1,4,7],
    [2,5,8]
    ]
    
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(play)
    play.to_i - 1 
  end 
  
  def move(index, player = "X")
    @board[index] = player
  end 
  
  def position_taken?(index)
    !(@board[index] == nil? || @board[index] == " ")
  end 
  
  def valid_move?(index)
    (@board[index] == nil || @board[index] == " ") && index.between?(0,8)
  end 
  
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def turn
    puts "Where would you like to move?  Choose a position from 1 - 9"
    play = gets.chomp 
    index = input_to_index(play)
    if valid_move?(index)
      token = current_player
      move(index, token)
      display_board
    else
      turn 
  end 
  end 
  
 def won?
  WIN_COMBINATIONS.each {|win_combo|
    index_0 = win_combo[0]
    index_1 = win_combo[1]
    index_2 = win_combo[2]

    position_1 = @board[index_0]
    position_2 = @board[index_1]
    position_3 = @board[index_2]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combo
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combo
    end
  }
  false
end

def full?
  @board.all?{|square| square != " " } 
end 

  def draw?
    if (won? == false && full? == true)
      true
    else (won? == true || full? == false)
      false
    end 
  end 
  
 def over?
  won? || draw?
 end 
  
  def winner
    winner_array = []
    winner_array = won?   
    if winner_array == false
      nil 
    else
      @board[winner_array[0]]
 end 
end 
  
  def play
    turn until over?
    
    if won?
      winner == "X" || winner == "O" 
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end 
  end 
end 
