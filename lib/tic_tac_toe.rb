require 'pry'
class TicTacToe 


def initialize 
  @board = Array.new(9, " ")
  counter = 0 
end

WIN_COMBINATIONS = [
  # R=row C=collumn D=diagonal 
  [0,1,2], #top R
  [3,4,5], #middle R
  [6,7,8], #bottom R
  [0,3,6], #left C
  [1,4,7], #middle C 
  [2,5,8], #right C 
  [0,4,8], #topleft_bottomright D 
  [6,4,2], #bottleft_topright D 
  ]

def display_board 
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(gets)
  num = gets.to_i - 1
  @board[num] = num
end

def move(move, token = "X")
    @board[move] = token
end

def position_taken?(index)
  if @board[index] == "X" 
    true 
  elsif @board[index] == "O"
    true
  else 
    false 
  end
  
end

def valid_move?(position)
  if position_taken?(position) 
     false 
  elsif (0..9).include?(position)
    true
  else 
    false
  end 
end
    
def turn_count
  counter = 0
  @board.each do |space|
    if space == "X" || space == "O"
      counter += 1   
    end
   end
  counter
end
    
def current_player
   turn_count % 2 == 0 ? "X" : "O"
end

def make_move(board, index, player)
  board[index] = player
end 

def turn
  puts 'Please enter 1-9:'
  move = gets
  index = input_to_index(move)
  if valid_move?(index)
    make_move(@board, index, current_player)
    display_board
  else
    turn
  end
end
    

def won?
  WIN_COMBINATIONS.each do |win|
    index_0 = win[0]
    index_1 = win[1]
    index_2 = win[2]

    position_1 = @board[index_0]
    position_2 = @board[index_1]
    position_3 = @board[index_2]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win
    end
  end
  return false
end

def full? 
 if @board.include?(" ")
   false 
 else 
   true 
 end
end

def draw? 
  if  full?  && !won?
     true
  else
     false
  end
end

def over? 
  if won? || draw?
    true 
  end 
end 

def winner 
  if won? == false
    return nil
  else
    if @board[won?[0]] == "X"
      return "X"
    else
      return "O"
    end
  end
end 


def play 
  until over? 
    turn 
  end 
  
  if won? 
    puts "Congratulations #{winner}!"
  elsif draw? 
    puts "Cat's Game!"
  end
    
end




end