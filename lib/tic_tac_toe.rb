require 'pry'

class TicTacToe
   
    WIN_COMBINATIONS = [
        [0,1,2], #top row
        [3,4,5], #middle row
        [6,7,8], #bottom row
        [0,3,6], #left-most column
        [1,4,7], #middle column
        [2,5,8], #right-most column
        [0,4,8], #L(top) to R(bottom) diagonal  
        [6,4,2] #L(bottom) to R(top) diagonal
    ]

    #not sure I understand why initialize works - refactoring it to board = array... & @board = board works
    def initialize(board = nil) #default argument of nil(necessary to past test)
        @board = board || Array.new(9, " ") #@board will equal nil or an array
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(n) #n = user's input, it will be 1-9 (but arrays start at 0)
        number = n.to_i - 1 #converted n to integer and subracted 1 = now index number friendly
    end

    def move (n, t="X") #n = index in board array, t = X or O
        @board[n] = t 
    end

    def position_taken?(n) #evaluate user's desired move & see whether position = already occupied
            #binding.pry
        if @board[n] == "X" || @board[n] == "O" #position is taken, should return true
            true
        else
            false
        end 
    end

    def valid_move?(n) #n = index #s NOT user input
        if n != 0..8 || @board[n] == "X" || @board[n] == "O"  #if move is not valid (b/c already occupied) should return false or nil
            false
        else
            true
        end 
    end

    def turn_count
        @board.count{|token| token == "X" || token == "O"} #will count how many Xs and Os there are on the board
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O" #if turn count is even = X, if turn count is odd = O
    end

    def turn
        user_input = gets #ask for input 
        index = input_to_index(user_input) #convert user_input into position on board
            if valid_move?(index)
                t = current_player
                move(index, t)
                display_board
            else
                turn
            end
    end

    def won?
        WIN_COMBINATIONS.collect do |i| #i = first array in constant. EX: @board[0] = [0, 1, 2]
            #what we want = 1st item in the 1st array
            #if the position is taken at the given index, and the 3 possible indexes to create the winning combo are all the same
            if position_taken?(i[0]) && @board[i[0]] == @board[i[1]] && @board[i[1]] == @board[i[2]]
                return i  
            end
        end
        false #wouldn't work if I put 'else false'
    end

    def full?
        @board.all? {|i| i == "X" || i == "O"} #no need to put "true if" b/c it'll automatically return true or false
    end

    def draw?
        full? && won? == false #need to put false
    end

    def over?
        won? || draw? #no need to put if, else, true. If full? == true, and won? == true, then it will turn true
    end

    def winner
        if won? #if true, won? will return i (winning array combo)
            i = won? #need to store the winning array combo in a variable
            @board[i[0]] #get first item from winning array combo
        end
    end

    def play
        turn until over?

        if won?
            puts "Congratulations #{winner}!"
        else draw?
            puts "Cat's Game!"
        end
    end

end

# 0 1 2
# 3 4 5
# 6 7 8

# def current_player
#     turn_count % 2 == 0 ? "X" : "O"
#   end
