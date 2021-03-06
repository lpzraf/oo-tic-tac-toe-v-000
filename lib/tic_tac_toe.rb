class TicTacToe
  # assign instance var to @board
   def initialize
    @board = Array.new(9, " ")
    end
# win combination
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
  
# display_board 
def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

# input_to_index 
def input_to_index(input)
   input.to_i - 1
end

# move
def move(index, current_player = "X")
   @board[index] = current_player
end

# valid_move? 
def valid_move?(index)
  if index < 0  || index > 8
    return false
  elsif @board[index] == "X" || @board[index] == "O"
    return false
  else
    true
  end
end

# position_taken? 
def position_taken?(index)
    if @board[index] == " "
    return false
    elsif @board[index] == "X" || @board[index] == "O" 
    return true 
 end
end

# turn_count
def turn_count
  counter = 0
  @board.each do |board_var|
    if board_var == "X" || board_var == "O"
    counter += 1
  end
  end
  counter
end

# current_player
def current_player
  if turn_count % 2 == 0 
    return "X"
  else 
    return "O"
  end
end

# turn 
def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  
  if valid_move?(index)
  move(index, current_player)
  display_board
  else 
    turn
  end
end

# won
def won?
  WIN_COMBINATIONS.detect do |winner|
  @board[winner[0]] == @board[winner[1]] && @board[winner[2]] == @board[winner[0]] && position_taken?(winner[0])
  end
end

def full?
  @board.all? do |full_var|
    full_var == "X" || full_var == "O"
  end
end


def draw?
  if won?
    return false
    elsif full? 
      return true
  end
end

def over?
    won? || draw?
end

def winner
  index_array = won?
  if index_array == nil 
    return nil
  end
  
  position = index_array[0]
    if @board[position] == "X"
      return "X"
    elsif @board[position] == "O"
      return "O"
  end 
end

# play
def play
while !over? 
  turn
end
  if draw?
  puts "Cat's Game!"
  elsif won?
  puts "Congratulations #{winner}!"
  end
end

end