require 'pry'
class TicTacToe

  attr_accessor :board

  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    board_choice = input.to_i - 1
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    @board[index].include?("X") || @board[index].include?("O")
  end

  def valid_move?(index)
    (0..8) === index && !self.position_taken?(index)
  end

  def turn
    puts "Please enter desired position: 1-9"
    desired_position = gets
    desired_position = self.input_to_index(desired_position)
    if self.valid_move?(desired_position)
      self.move(desired_position, current_player)
      self.display_board
    else
      puts "Move invalid, try again."
      desired_position = gets
    end
  end

  def turn_count
    counter = 0
    @board.map do |x|
      if x == "X" || x == "O"
        counter  += 1
      end
    end
    counter
  end

  def current_player
    if self.turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

  def won?
    result = false
    WIN_COMBINATIONS.map do |combo|
      check_array = []
      combo.map do |y|
        check_array << @board[y]
      end
      if check_array[0] == check_array[1] && check_array[1] == check_array[2] && check_array[0] != " "
        result = combo
      end
    end
    result
  end

  def full?
    @board.none?(" ")
  end

  def draw?
    if self.full? && !self.won?
      true
    else
      false
    end
  end

  def over?
    if self.draw? || self.won?
      true
    else
      false
    end
  end

  def winner
    if self.won?
      winner = self.won?[0]
      @board[winner]
    else
      nil
    end
  end

  def play

    until self.over? do
      self.turn
      self.turn_count
    end
    if self.won?
      puts "Congratulations #{self.winner}!"
    else
      puts "Cat\'s Game!"
    end
  end

end
