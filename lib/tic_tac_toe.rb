class TicTacToe

    WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [0,3,6],
    [1,4,7],
    [2,5,8]
]
    def initialize
       @board = Array.new(9, " ")
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "------------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "------------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(user_input)
        user_input.to_i - 1
    end

    def move(index, token = "X") #allows "x" player in the top left and "o" in the middle
        @board[index] = token
    end

    def position_taken?(index) #returns true/false based on whether the position ON THE BOARD is already occupied
        !(@board[index].empty? || @board[index] == " ")
    end

    def valid_move?(index) # returns true/false based on whether the postion IS already occupied and checks that the attempted move is within the bounds of the game board
        index.between?(0,8) && !position_taken?(index)
    end

    def turn_count #counts occupied positions
        turn = 0
        @board.each do |index|
            if index == "X" || index == "O"
                turn += 1
            end
        end
        return turn
    end

    def current_player #returns the correct player, X, for the third move; returns the correct player, O, for the fourth move
        #if the turn count is an even number, that means O just went, so the next/current player is X
        num_turns = turn_count
        if num_turns % 2 == 0
          player = "X"
        else
          player = "O"
        end
        return player
      end
    
    def turn 
        #receives user input via the gets method
        #calls input_to_index, valid_move?, and current_player
        #makes valid moves and displays the board
        #asks for input again after a failed validation
        puts "Please choose a number 1-9:" 
        user_input = gets.chomp 
        index = input_to_index(user_input) 
        if valid_move?(index)
          player_token = current_player
          move(index, player_token)
          display_board
        else
          turn
        end
      end

    def won? #returns false for a draw ; returns the winnding combo for a win
        WIN_COMBINATIONS.each {|win_combo| 
            index_0 = win_combo[0]
            index_1 = win_combo[1]
            index_2 = win_combo[2]

            position_1 = @board[index_0]
            position_2 = @board[index_1]
            position_3 = @board[index_2]

            if position_1 == "X" && position_2 == "X" && position_3 == "X"
                return win_combo
            elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
                return win_combo
            end
        }
        return false
    end

    def full? #this will return true if every element in the board contains either an "X" or an "O"
        @board.all? {|index| index == "X" || index == "O"}
    end

    def draw? #returns true if the board is full and has not been won; false if the board is won; and false if the board is neither won nor full
        if !won? && full?
            return true
        else 
            return false 
        end
    end
    
    def over? #returns true for a draw; returns true for a won game; returns false for an in-progress game
        if won? || draw?
            return true
        else 
            return false 
        end
    end

    def winner # this will return X when X wins; returns O when 0 wins; returns nil when no winner
        index = []
        index = won?
        if index == false
            return nil
        else 
            if @board[index[0]] == "X"
                return "X"
            else
                return "O"
            end
        end
    end

    def play
        until over? == true
            turn
        end

        if won?
            puts "Congratulations #{winner}!"
          elsif draw?
            puts "Cat's Game!"
    end
end

end

