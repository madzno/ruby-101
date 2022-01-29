# Tic Tact Toe
# 1. Display the inital 3x3 board
# 2. Ask the user to mark a square.
# 3. Computer marks a square
# 4. Display the updated board state
# 5. If winner, display winner.
# 6. If board is full, display tie.
# 7. If neither winner nor board is full, go to number 2
# 8. Play again?
# 9. If yes, go to 1
# 10. Good bye!

INITAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

WINNING_NUMBER = 3

WINNING_SCORE = 5

def prompt(message)
  puts "=> #{message}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts "First player to win #{WINNING_SCORE} rounds is the Ultimate Winner!"
  puts ""
  puts "     |     |     "
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]} "
  puts "     |     | "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]} "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]} "
  puts "     |     |     "
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initalize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITAL_MARKER }
end

def joinor(arr, symbol = ', ', word = 'or')
  case arr.size
  when 0 then ' '
  when 1 then arr.first
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(symbol)
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt("Choose a square (#{joinor(empty_squares(brd))}):")
    square = gets.chomp.to_i
    if empty_squares(brd).include?(square)
      break
    else
      prompt("Sorry, that's not a valid input")
    end
  end

  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_ultimate_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == WINNING_NUMBER
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == WINNING_NUMBER
      return 'Computer'
    end
  end
  nil
end

def update_score(brd, score)
  if detect_winner(brd) == 'Player'
    score[:player] += 1
  else detect_winner(brd) == "Computer"
    score[:computer] += 1
  end
  nil
end

def display_score(score)
  puts "Players score is #{score[:player]}, Computers score is #{score[:player]}"
end

def detect_ultimate_winner(score)
  if score[:player] == 5
    return "Player"
  else score[:computer] == 5
    return "Computer"
  end
  nil
end

loop do
  board = initalize_board
  score = { player: 0, computer: 0}

  loop do
    display_board(board)
    player_places_piece!(board)
    computer_places_piece!(board)
    update_score(board, score)
    display_score(score)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt("#{detect_winner(board)} won!")
  else
    prompt("It's a tie!")
  end

  prompt("Play again? (y or n)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thanks for playing tic-tac-toe, Goodbye!")


