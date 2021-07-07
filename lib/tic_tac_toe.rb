require "pry"
class TicTacToe
  
  WIN_COMBINATIONS = [
  [0,1,2], 
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  
]
  
  
  def initialize 
    @board = Array.new(9, " ")
  end
  
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end
  # valuates if the position is avaiables
  def position_taken?(input)
    ((@board[input] == "X") || (@board[input] == "O" ))
  end
  
  def move(index, token = "X")
    @board[index] = token
  end

  def valid_move?(move)
    move.between?(0,8) && !position_taken?(move)
  end
  
  def turn_count
    
    number_o_turns = 0 
    @board.each do |turn|
      if turn == "X" || turn == "O"
        number_o_turns += 1 
      end
      
    end
    number_o_turns
  end


  def current_player
    if turn_count.even?
      "X"
    else 
      "O"
    end
  end
  
  def turn
    puts "enter a number between 1 and 9"
   input = gets 
   input = input_to_index(input)
   if valid_move?(input)
     move(input, current_player)
   else 
     turn
   end
    display_board
  end 
  
  def won?
    WIN_COMBINATIONS.detect do |combo|
	 if position_taken?(combo[0])
	  position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
	end
end
end

def full?
    is_full_board = true 
  @board.each_with_index do |value, idx|
      if position_taken?(idx) == false
        is_full_board = false
      end
     end
   is_full_board
end


def draw?

 if full? && !won?
   true
   elsif  won?
    false
   elsif !won? && !full?
    false
 
 end
 
end

def over?
  #if game is won or is a draw return true
  if draw? || won?
    true
    
  # else return false
end
end

def winner 
  #return X when X won
  #return O when O won 
  #returns nil when no winner
  WIN_COMBINATIONS.detect do |combo_win|
    if (@board[combo_win[0]]) == "X" && (@board[combo_win[1]]) == "X" && (@board[combo_win[2]]) == "X"
        return "X"
    elsif (@board[combo_win[0]]) == "O" && (@board[combo_win[1]]) == "O" && (@board[combo_win[2]]) == "O"
        return "O"
    else
      nil
   end
  end
end

def play 
  until over? 
    turn
  
  end
  if won?
    puts "Congratulations #{winner}!"
  else
    puts "Cat's Game!"
    
  end
end





  
  
end