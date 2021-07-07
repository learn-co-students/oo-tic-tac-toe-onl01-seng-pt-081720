require 'pry'
class TicTacToe
WIN_COMBINATIONS =[[0,1,2], 
[3,4,5], 
[6,7,8],  
[0,3,6],  
[1,4,7],  
[2,5,8], 
[0,4,8],  
[6,4,2] 
]
  def initialize (board=nil)
    @board = Array.new(9," ")
  end
  
def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(player)
  player = player.to_i - 1
  player
end

def move (index, player_token)
   @board[index] = player_token
end

  def position_taken?(index)
     if @board[index] == " "
       false
     else
       true
     end
  end
  
  def valid_move?(index)
    if @board[index] == " " && index.between?(0,8)
       true
     else
      false
     end
  end
  def turn_count
    counter = 0
    @board.each do |value|
      if value == "X" || value == "O"
      counter += 1 
      end
    end
    counter
  end
  
  def current_player
    if turn_count.even?
      "X"
    else
      "O"
    end
  end
  
  def turn 
    puts "Please enter 1-9: "
    user_input = gets.chomp 
    user_input = input_to_index(user_input)
     if valid_move?(user_input)
       move(user_input, current_player)
     else
       turn 
     end
     display_board
  end
  
  def won?
    WIN_COMBINATIONS.find do |winning_combo|
      @board[winning_combo[0]] == @board[winning_combo[1]] &&
      @board[winning_combo[1]] == @board[winning_combo[2]] &&
      position_taken?(winning_combo[0])
   end
  end
  
  def full?
   if  turn_count == 9
     true
   else
     false
   end
  end
  
  def draw?
    if full? && !won?
      true
    end
  end
  
  def over?
    if draw?
      true
    else
      won?
    end
  end
  
  def winner
    if won?
      @board[won?.first]
    end
  end
  
  def play 
    until over?
    turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else draw?
     puts "Cat's Game!"
    end
  end
end