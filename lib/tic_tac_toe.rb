


class TicTacToe
        WIN_COMBINATIONS = [[0,1,2,],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    def initialize
        @board = Array.new(9, " ")
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(user_input)
        user_input_integer = (user_input).to_i
        friendly_format_input = user_input_integer - 1
        friendly_format_input
    end

    def move(index, token = "X")
        @board[index] = token
    end

    def position_taken?(index)
        if @board[index] == "X" || @board[index] == "O"
            true
        else 
            false
        end
    end

    def valid_move?(position)
        !position_taken?(position) && (position.between?(0,8))
         
    end

    def turn
        puts "Do your move between the number 1 and 9"
        input = gets.chomp
        index = input_to_index(input)
        player = current_player
        if valid_move?(index)
            move(index, player)
            display_board
        else
            turn
        end

    end

    def turn_count
        # number = 9 - @board.count(" ")
        # number
        @board.count{|x| x != " "}
    end

    def current_player
        if turn_count.odd?
            return "O"
        else
            return "X"
        end
    end

    def won?
        WIN_COMBINATIONS.detect do |winner|
            @board[winner[0]] == @board[winner[1]] &&
            @board[winner[1]] == @board[winner[2]] &&
            position_taken?(winner[0])
            # if (@board[winner[0]] == "X" && @board[winner[1]] == "X" && @board[winner[2]] == "X")
            #     return winner
            # elsif (@board[winner[0]] == "O" && @board[winner[1]] == "O" && @board[winner[2]] == "O")
            #     return winner
            # end
        end
    end

    def full? 
      if @board.include?(" ")
            false
      else 
        return true
      end
    end

    def draw?
        full? && !won?
        # if (full? == true && won? == (false || nil))
        #     true
        # else 
        #     false
        # end
    end

    def over?
        draw? || won?
        # if (draw? == true || full? == true || won? == true)
        #     true
        # else 
        #     false
        # end
    end

    def winner 
        WIN_COMBINATIONS.detect do |winner|
            if (@board[winner[0]] == "X" && @board[winner[1]] == "X" && @board[winner[2]] == "X")
                return "X"
            elsif (@board[winner[0]] == "O" && @board[winner[1]] == "O" && @board[winner[2]] == "O")
                return "O"
            else
                nil
            end
        end
    end

    def play
        while (!over?)
            turn
        end
        if (won?)
            puts "Congratulations #{winner}!"
        elsif (draw?)
            puts "Cat's Game!"
        end
    end

end

# game = TicTacToe.new
# game.play