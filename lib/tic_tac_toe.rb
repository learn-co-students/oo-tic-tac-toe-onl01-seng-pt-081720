require 'pry'

class TicTacToe

    WIN_COMBINATIONS = [
    #Board layout
    # 0 | 1 | 2
    #-----------
    # 3 | 4 | 5
    #-----------
    # 6 | 7 | 8

    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],  # Bottom row
    [0,3,6],  # Left col
    [1,4,7],  # Middle col
    [2,5,8],  # Right col
    [0,4,8],  # \
    [2,4,6]  # /
  ]

    def initialize
        @board = Array.new(9," ")
    end  
      
    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end


    def input_to_index(player_input)
        player_input.to_i - 1
    end 

    def move(index, token = "X")
        @board[index] = token
    end

    def position_taken?(index)
        ((@board[index] == "X" || @board[index] == "O"))
        #research double parentheses
    end

    def valid_move?(index)
        index.between?(0,8) && !position_taken?(index)
        #ask about ! and why it is necessary
    end 

    def turn_count
        @board.count{|token| token == "X" || token == "O"}
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end

    def turn
        puts "Please enter a position 1-9!"
        player_input = gets.strip
        index = input_to_index(player_input)
        if valid_move?(index)
            token = current_player
            move(index, token)
            display_board
        else
            turn
        end
    end 

    def won?
        WIN_COMBINATIONS.detect do|combo|
         if @board[combo[0]] != " " && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
           return combo
         end
       end
     end

     def full?
        @board.all?{|occupied| occupied != " "}
       end

    def draw?
       !(won?) && (full?)
    end

    def over?
        won? || full? || draw?
    end

    def winner
        if won?
          win_combo = won?
          @board[win_combo[0]]
         else 
          nil 
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