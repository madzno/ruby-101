VALID_CHOICES = %w(rock paper scissors lizard spock)

VALID_NUMBERS = { "1" => "rock",
                  "2" => "paper",
                  "3" => "scissors",
                  "4" => "lizard",
                  "5" => "spock" }

WINNING_COMBOS = { "rock" => ["lizard", "scissors"],
                   "paper" => ["rock", "spock"],
                   "lizard" => ["spock", "paper"],
                   "spock" => ["rock", "scissors"],
                   "scissors" => ["paper", "lizard"] }

WINNING_SCORE = 3

CHOICE_PROMPT = <<-MSG
      Choose one:
      1) rock
      2) paper
      3) scissors
      4) lizard
      5) spock
      MSG

def prompt(message)
  puts "=> #{message}"
end

def get_player_choice(players_input)
  loop do
    prompt(CHOICE_PROMPT.to_s)
    players_input = gets.chomp
    break if players_input == validate_choice?(players_input)
  end
  players_input
end

def validate_choice?(players_choice)
  if VALID_NUMBERS.include?(players_choice)
    players_choice
  else
    prompt("That's not a valid choice.")
  end
end

def win?(first, second)
  (WINNING_COMBOS[first]).include?(second)
end

def win_for_display?(players_move, computers_move)
  win?(players_move, computers_move)
end

def display_result(player, computer)
  if win_for_display?(player, computer)
    prompt("You won!")
  elsif win_for_display?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

def display_grand_winner(player_wins, _)
  if player_wins == WINNING_SCORE
    prompt("You are the grand winner!")
  else
    prompt("Computer is the grand winner!")
  end
end

def get_play_again(users_input)
  loop do
    prompt("Want to play again? Type 'y / yes' if yes and 'n / no' if no")
    users_input = gets.chomp
    if users_input.downcase == ("y" || "yes") ||
       users_input.downcase == ("n" || "no")
      break
    else
      prompt("Hmm.. that doesn't look like a valid choice")
    end
  end
  users_input
end

prompt("Welcome to Rock Paper Scissors Lizard Spock!")
prompt("First player with three wins is the grand winner!")

loop do
  totals = { player: 0, computer: 0 }
  loop do
    choice = get_player_choice(choice)
    computer_choice = VALID_CHOICES.sample

    system("clear")

    prompt("You chose #{VALID_NUMBERS[choice]}. "\
            "Computer chose #{computer_choice}.")

    display_result(VALID_NUMBERS[choice], computer_choice)

    if win?(VALID_NUMBERS[choice], computer_choice)
      totals[:player] += 1
    elsif win?(computer_choice, VALID_NUMBERS[choice])
      totals[:computer] += 1
    end

    prompt("Your total: #{totals[:player]}. "\
             "Computer total: #{totals[:computer]}.")

    break if (totals[:player] == WINNING_SCORE) ||
             (totals[:computer] == WINNING_SCORE)
  end
  display_grand_winner(totals[:player], totals[:computer])

  play_again = get_play_again(play_again)
  break unless play_again == ("y" || "yes")
end

prompt("Thank you for playing! Goodbye")
