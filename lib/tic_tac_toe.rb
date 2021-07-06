class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " " )
  end

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

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move (index, token = "X")
    @board[index] = token
  end

  def position_taken?(user_input)
     @board[user_input] != ( " " )
  end

  def valid_move?(index)
    !(index > 9 || index < 0) && !position_taken?(index)
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
   @board.count{|token| token == "X" || token == "O"}
  end

  def turn
    puts "Enter input"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    # flag = false
    # counter = 0
    WIN_COMBINATIONS.detect do |combo|
       temp = @board[combo[0]]
       temp1 = @board[combo[1]]
       temp2 = @board[combo[2]]
       temp == temp1 && temp2 == temp && position_taken?(combo[0])
     end
      #  x.each do |y|
      #    if @board[y] == ( " " )
      #       flag = false
      #       counter = 0
      #     elsif @board[y] != temp
      #       flag = false
      #       counter = 0
      #     elsif @board[y] == temp
      #       flag = true
      #       counter += 1
      #       if counter == 3
      #         return x
      #       end
      #     end
      #   end
      # end
      #     return false
      end

      def full?
        @board.all? do |z|
        z != " "
        end
      end

      def draw?
       full? && !won?
      end

      def over?
        won? || draw?
      end

      def winner
        if won?
          return @board[won?[0]]
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
