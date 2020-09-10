class TicTacToe
    attr_accessor :board

    def initialize(board = nil)
        @board = board || Array.new(9," ")
    end

    WIN_COMBINATIONS =[
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
    ]

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
      end

      def input_to_index(user_move)
        user_move.to_i - 1
      end

      def move(space,token)
        @board[space] = token
      end

      def position_taken?(move)
        ((@board[move] == "X") || (@board[move] == "O"))
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
        puts "It's your move! Enter 1-9"
        player_input = gets.strip
        index = input_to_index(player_input)
        player = current_player
        if valid_move?(index)
            move(index, player)
            display_board
        else
            turn
        end
      end

      def won?
        WIN_COMBINATIONS.detect do |win|
          if (@board[win[0]]) == "X" && (@board[win[1]]) == "X" && (@board[win[2]]) == "X"
            return win
          elsif (@board[win[0]]) == "O" && (@board[win[1]]) == "O" && (@board[win[2]]) == "O"
            return win
          end
            false
        end
      end

      def full?
        @board.all?{|full| full != " "}
      end

      def draw?
        !(won?) && (full?)
      end

      def over?
        won? || full? || draw?
      end

      def winner
        WIN_COMBINATIONS.detect do |win|
          if (@board[win[0]]) == "X" && (@board[win[1]]) == "X" && (@board[win[2]]) == "X"
            return "X"
          elsif (@board[win[0]]) == "O" && (@board[win[1]]) == "O" && (@board[win[2]]) == "O"
            return "O"
          else
            nil
          end
        end
      end

      def play
        while over? == false
          turn
        end
        if won?
          puts "Congratulations #{winner}!"
        elsif draw?
          puts "Cat's Game!"
        end
      end
    end