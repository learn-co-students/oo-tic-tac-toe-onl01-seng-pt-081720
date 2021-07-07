class TicTacToe
  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end
  
  WIN_COMBINATIONS = [ [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [6,4,2] ]
        
    def display_board
        print " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        print "-----------"
        print " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        print "-----------"
        print " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end    
    def input_to_index(player_input)
      player_input = player_input.to_i
      index = player_input-1
    end
    def move(index, player = "X")
      @board[index] = player
    end
    def position_taken?(index)
      @board[index]== "X" || @board[index] == "O"
    end 
    def valid_move?(index)
      index.between?(0,8) && !position_taken?(index)
    end
    def turn_count
      @board.count{|token| token == "X" || token == "O"}
    end
    def current_player
      turn_count % 2 == 0 ? "X" : "O"
    end
    def turn
      puts "Please enter 1-9:"
      user_input = gets.strip
      index = input_to_index(user_input)
      if valid_move?(index)
      move(index, current_player)
      display_board
      else
      turn
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
  def full?
    @board.all?{|token| token == "X" || token == "O"}
  end
  def draw?
    !won? && full?
  end
  def over?
    won? || draw?
  end 
  def winner
    if won?
      @board[won?[0]] == "X" ? "X" : "O"
    else
      nil
    end
  end
  
  def play 
  while !over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end
end    
end

 
  
    


























