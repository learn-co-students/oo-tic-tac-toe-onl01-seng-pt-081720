require 'pry'

class TicTacToe
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [0,4,8],
    [0,3,6], 
    [1,4,7],
    [2,4,6],
    [2,5,8],
    [3,4,5],
    [6,7,8]
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
    puts "-----------"
  end
  
  def input_to_index(user_input)
    user_input.to_i - 1
  end
  
  def move(index, token)
    @board[index] = token
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
  
  def valid_move?(index)
    if @board[index] == "X"
      false 
    elsif @board[index] == "O"
      false
    elsif index.between?(0,8)
      true
    end
  end
    
  def turn_count
    @board.count("X") + @board.count("O")
  end
  
  def current_player
    if turn_count.even?
      "X"
    elsif turn_count.odd?
      "O"
    end
  end
  
  def turn
    puts "enter a number between 1 and 9"
    input = gets
    index = input_to_index(input)
      if valid_move?(index)
          move(index, current_player)
      else
          turn
      end
    display_board
  end
  
  def won?
    if a = WIN_COMBINATIONS.find { |combo| 
      @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" }
      a 
    elsif b = WIN_COMBINATIONS.find { |combo| 
      @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O" }
      b
    else 
      false
    end
  end
  
  def full?
    @board.all? { |element| element == "X" || element == "O" }
  end
  
  def draw?
    if !won? && full? 
      true
    else
      false
    end
  end
  
  def over?
    if won? || draw?
      true
    else
      false
    end
  end
  
  def winner
    index = []
    index = won?
    if index == false
      nil
    else 
      if @board[index[0]] == "X"
        "X"
      else
        "O"
      end
    end
  end
  
  def play 
    turn until over? == true
    
    if won?
      puts "Congratulations #{winner}!"
    
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
end


