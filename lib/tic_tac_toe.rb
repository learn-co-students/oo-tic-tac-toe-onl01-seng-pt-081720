class TicTacToe
  
  WIN_COMBINATIONS = [
    [0, 1, 2], # top row
    [3, 4, 5], # middle row
    [6, 7, 8], # bottom row
    [0, 3, 6], # left column
    [1, 4, 7], # middle column
    [2, 5, 8], # right column
    [0, 4, 8], # diagonal left to right
    [2, 4, 6] # diagonal right to left
    ]
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(gets)
    (gets.to_i) - 1
  end
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
    @board[index] != " "
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
  def current_player
    # used ternary operator
    # condition ? 1st expression : 2nd expression
    # if true, it's X, if false, it's O
    turn_count.even? ? "X" : "O"
  end
  
  def turn
      puts "Make a move by choosing a position between 1 - 9."
      # upon lots of Googling, adding STDIN. to gets fixes an Errno::ENOENT no such file or directory @ rb_sysopen error. BUT then it causes an error with the test to use the gets method to accept an input...
      input = gets.strip
      index = input_to_index(input)
      cp = current_player
      if valid_move?(index)
       move(index, cp)
        display_board
      else
        turn
      end
  end
  
  
  def won?
    a = WIN_COMBINATIONS.find{
      |combo|
      @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
    }
    b = WIN_COMBINATIONS.find{
      |combo|
      @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
    }
    return a || b
  end
  
  # iterates thru board asking if all of its data contains either X OR O
  def full?
    @board.all?{|token| token == "X" || token == "O"}
  end
  
  # it's a draw if the game is not won and the board is full
  def draw?
    !won? && full?
  end
  
  def over?
    won? || draw?
  end
  
  def winner
    if combo = won?
      @board[combo[0]]
    end
  end
  
  
  
  def play
    turn until over?
    # if game was won                     else if a draw
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end
  
end





