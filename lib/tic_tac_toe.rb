require 'pry'

class TicTacToe

    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [6,4,2]
    ]

    def initialize(board = nil)
        @board = board || Array.new(9, " ");
    end

    def display_board
        counter_index = 0
        row_counter = 0
        while row_counter < 3
            puts " #{@board[counter_index]} | #{@board[counter_index+1]} | #{@board[counter_index+2]} "
            if row_counter < 2
                puts "-----------"
            end
            row_counter += 1
            counter_index += 3
        end
    end

    def input_to_index(string_input)
        string_input.to_i - 1
    end

    def move(position, player)
        @board[position] = player
    end

    def position_taken?(index_to_check)
        if @board[index_to_check] == " "
            false;
        else
            true;
        end
    end

    def valid_move?(index_to_check)
        count_spaces = @board.size
        final_value = false;
        if index_to_check.between?(0, count_spaces)
            if @board[index_to_check] == " "
                final_value = true;
            else
                final_value = false;
            end
        end
        final_value
    end

    def turn_count
        final_count = 0
        @board.each do |item|
            if item != " "
                final_count += 1
            end
        end
        final_count
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end

    def turn
        puts "Please enter a number 0-9 where you'd like to move"

        user_input = gets.strip
        adjusted_index = input_to_index(user_input)

        if valid_move?(adjusted_index)
            move(adjusted_index, current_player)
            display_board
        else
            turn
        end 
    end

    def won?
      WIN_COMBINATIONS.detect do |combo|
        start_index = 0
        if @board[combo[start_index]] == "X" && @board[combo[start_index + 1]] == "X" && @board[combo[start_index+2]] == "X"
            return combo
        elsif @board[combo[start_index]] == "O" && @board[combo[start_index + 1]] == "O" && @board[combo[start_index + 2]] == "O"
            return combo
        end
        false
      end
    end

    def full?
        if @board.include?(" ")
            false
        else
            true
        end
    end

    def draw?
        if won? == nil && full? == true
            true
        else
            false
        end
    end

    def over?
        if won? != nil || full? == true || draw? == true
            true
        else
            false
        end
    end

    def winner
        winner_string = nil
        if won? != nil
            winner_string = @board[won?[0]]
        end
        winner_string
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