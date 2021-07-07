require 'pry'

class TicTacToe

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 4, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 4, 6],
    [2, 5, 8] #all possible win combos
  ]

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "] #would not pass w/argument, test said it expected 1 given 0 
  end

  def display_board # empty board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1 # taking user_input, subtract; caught up on index being +1 when we needed to subtract
  end

  def move(index, token)
    # takes in 2 arguements
    # index, token = X || O
    # def token = X
    # binding.pry
    @board[index] = token
  end

  def position_taken?(index)
    # checks index val
    # sees if position contains X || O
    # binding.pry
    @board[index] == "X" || @board[index] == "O"
  end

  def valid_move?(index)
    # if valid => true
    # if invalid => false/nil
    # binding.pry
    index.between?(0, 8) && !position_taken?(index) #returns false for [4]
  end

  def turn_count # => num of turns played
    # binding.pry
    @board.count{ |token| token == "X" || token == "O" } # counts num of tokens on board
    # binding.pry
  end

  def current_player
    # uses turn_count to see which turn it is => 2
    # binding.pry
    if turn_count % 2 == 0
      "X"
    else 
      "O"
    # binding.pry
    end
  end

  def turn
    # calls on input_to_index, valid_move?, current_player

    #ask user for move 1-9
    puts "choose a number 1-9: "
    # receive user_input
    input = gets.chomp
    # translate into index val
    index = input_to_index(input)
    player = current_player
    # if val, make the move, display board
    if valid_move?(index)
      move(index, player)
      display_board
    # if inval, ask for new move until val
    else 
      turn
    end
  end

  def won?
    # return false/nil if no winning combo present
    # return winning combo  
    a = WIN_COMBINATIONS.find{ |combo| @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" }
    b = WIN_COMBINATIONS.find{ |combo| @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O" }
    a || b
  end

  def full?
    # returns true if every element contains x || o
    # binding.pry
    @board.all? do |index|
      index == "X" || index == "O"
    end
  end

  def draw?
    # binding.pry
    if won? # return false for winning combos
      false
    elsif full? == false #if full? returns false, then
      false
    else # return true as draw?
      true
    end
  end

  def over?
    #returns true IF board has been won? || full?
    if won? || draw?
      true
    end
  end

  def winner
    # when @board = winning combo
    # returns X || O 
    # binding.pry
    if winning_combo = won?
      @board[winning_combo[0]] # needed "if" to return nil when no winner present
    end
  end

  def play
    # binding.pry
    # loop
    # until game_over
    # take turns
    # if won?
    # congrats to the winner X || O
    # else if draw?
    # puts "cats game"

    until over? # originally used while, failed checking for draw after each turn
      turn
    end

    if draw?
      puts "Cat's Game!" 
    elsif winner == "X" || winner == "O" 
      puts "Congratulations X!"
      puts "Congratulations O!"
    end
  end

end