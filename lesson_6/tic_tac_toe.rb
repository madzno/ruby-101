#imports
require 'yaml'

#constants
MESSAGES = YAML.load_file('tictactoe_messages.yml')

INITAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
INITAL_SQUARE = 5

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

WINNING_NUMBER = 3

MAX_SCORE = 5

#methods
def prompt(message)
  puts "=> #{message}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
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

def initalize_score
  score_board = { player: 0, computer: 0}
end

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

def get_first_player
  choice = ''
  loop do
    prompt(MESSAGES['move_first'])
    choice = gets.chomp
    break if choice == 'u' || choice == 'c'
    prompt(MESSAGES['valid_choice'])
  end
  choice
  case choice
    when 'u' then 'user'
    when 'c' then 'computer'
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
      prompt(MESSAGES['valid_choice'])
    end
  end

  brd[square] = PLAYER_MARKER
end

def find_at_risk_square(line, brd, marker)
  if brd.values_at(*line).count(marker) == 2
    brd.select{|k, v| line.include?(k) && v == INITAL_MARKER}.keys.first
  else
    nil
  end
end

def computer_places_piece!(brd)
  square = nil

  #offense
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, COMPUTER_MARKER)
      break if square
    end

  # defense
  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, PLAYER_MARKER)
      break if square
    end
  end

  # square 5
  if !square && brd[INITAL_SQUARE] == INITAL_MARKER
    square = INITAL_SQUARE
  end

  #random
  if !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def detect_round_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == WINNING_NUMBER
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == WINNING_NUMBER
      return 'Computer'
    end
  end
  nil
end

def round_won?(brd)
  !!detect_round_winner(brd)
end

def round_over?(brd)
  round_won?(brd) || board_full?(brd)
end

def play_game!(board, first_player)
  loop do
    if first_player == 'user'
      display_board(board)
      player_places_piece!(board)
      computer_places_piece!(board)
      break if round_over?(board)
    elsif first_player == 'computer'
      computer_places_piece!(board)
      display_board(board)
      break if round_over?(board)
      player_places_piece!(board)
    end
  end
end

def display_round_winner(board)
  if round_won?(board)
    prompt("#{detect_round_winner(board)} won!")
  else
    prompt(MESSAGES{'tie'})
  end
end

def update_score(winner, score)
  if winner == 'Player'
    score[:player] += 1
  elsif winner == 'Computer'
    score[:computer] += 1
  end
end

def display_score(score)
   puts "Players score is #{score[:player]}, Computers score is #{score[:computer]}"
 end

def ultimate_winner?(score)
  score[:player] == MAX_SCORE || score[:computer] == MAX_SCORE
end

def display_ultimate_winner(score)
  if score[:player] == MAX_SCORE
    prompt(MESSAGES['player_ultimate_winner'])
  elsif score[:computer] == MAX_SCORE
    prompt(MESSAGES['computer_ultimate_winner'])
  end
end

def play_again?
  prompt(MESSAGES['play_again'])
  answer = gets.chomp
  return true if answer.start_with?('y')
end

#welcome messages
prompt(MESSAGES['welcome'])
prompt("You're #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}.")
prompt("First player to win #{MAX_SCORE} rounds is the Ultimate Winner!")

# main loop
loop do
  score = initalize_score
  first_player = get_first_player
  system 'clear'

  # round of 5 games
  loop do
    board = initalize_board

    sleep(1)

    play_game!(board, first_player)

    update_score(detect_round_winner(board), score)

    display_round_winner(board)

    display_score(score)

    break if ultimate_winner?(score)
  end

  display_ultimate_winner(score)

  break unless play_again?
end

prompt(MESSAGES['good_bye'])
