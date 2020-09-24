class TicTacToe

    def initialize(board = nil)
        @board = Array.new(9, " ")
    end

    WIN_COMBINATIONS = [
        [0,1,2], 
        [3,4,5], 
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]]

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
    
    def input_to_index(input)
        input = input.to_i - 1
    end

    def move(index, token = "X")
        @board[index] = token
    end

    def position_taken?(index)
        @board[index] == "X" || @board[index] == "O"
        #boolean returns true/false
    end

    def valid_move?(index)
        #if the index is 1-8, true
        #if the index is empty, true
        index.between?(0,8) && !position_taken?(index) #bang operater = opposite 
    end

    def turn_count
        counter = 0
        @board.each do |index|
            if index == "X" || index == "O"
                counter += 1
            end
        end
        counter
    end

    def current_player
        turn_count.odd? ? ("O") : ("X") #Yay for shorthand if else statements!!!!!
    end

    def turn
        puts "Enter a number from 1-9"
        input = gets.chomp #gets automatically puts a line break after the input. must chomp line break
        index = input_to_index(input) #uses the input to index method to literally change the input to index
        if valid_move?(index) #aka if true (boolean method)
            move(index, current_player) # returns move method that takes in defined index (above) and current player method as defined in the class
            display_board #displays the board
        else
            turn #asks for another input
        end
        #still don't know how to use shorthand :///
    end

    def won?
        WIN_COMBINATIONS.detect do |win_combo| # .detect returns the first element that satisfies the below condition
          if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X" #if XXX
            return win_combo
          elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O" #if OOO
            return win_combo #return the WIN_COMBINATIONS that first matched
          end
            false
        end
    end

    def full? 
        @board.all? {|space| space != " " }
    end

    def draw?
        !won? && full?
    end

    def over?
        won? || full? || draw?
    end

    def winner
        WIN_COMBINATIONS.detect do |win_combo| # .detect returns the first element that satisfies the below condition
            if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X" #if XXX
                return "X"
            elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O" #if OOO
                return "O"
            else
                nil
            end
        end
    end

    def play 
        turn until over?
        won? ? puts("Congratulations #{winner}!") : puts("Cat's Game!")
    end
end