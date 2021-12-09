VALID_CHOICES = %w(rock paper scissors lizard spock)

VALID_NUMBERS = { "1" => "rock",
                  "2" => "paper",
                  "3" => "scissors",
                  "4" => "lizard",
                  "5" => "spock" }

def prompt(message)
  puts "=> #{message}"
end

def validate_choice?(players_choice)
  if VALID_NUMBERS.include?(players_choice)
    players_choice
  else
    prompt("That's not a valid choice.")
  end
end

def win?(first, second)
  winner = { "rock" => ["lizard", "scissors"],
             "paper" => ["rock", "spock"],
             "lizard" => ["spock", "paper"],
             "spock" => ["rock", "scissors"],
             "scissors" => ["paper", "lizard"] }
  (winner[first]).include?(second)
end

def display_result(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

def display_grand_winner(player_wins, _)
  if player_wins == 3
    prompt("You are the grand winner!")
  else
    prompt("Computer is the grand winner!")
  end
end

player_total = 0
computer_total = 0

loop do
  loop do
    choice = ""
    loop do
      choice_prompt = <<-MSG
      Choose one:
      1) rock
      2) paper
      3) scissors
      4) lizard
      5) spock
      MSG
      prompt(choice_prompt.to_s)
      choice = gets.chomp
      break if choice == validate_choice?(choice)
    end
    computer_choice = VALID_CHOICES.sample
    prompt("You chose #{VALID_NUMBERS[choice]}.
            Computer chose #{computer_choice}.")

    display_result(VALID_NUMBERS[choice], computer_choice)

    if win?(VALID_NUMBERS[choice], computer_choice)
      player_total += 1
    elsif win?(computer_choice, VALID_NUMBERS[choice])
      computer_total += 1
    else
      player_total += 0 && computer_total += 0
    end

    break if player_total == 3 || computer_total == 3
  end

  display_grand_winner(player_total, computer_total)
  prompt("Want to play again? Type 'y' if yes")
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end

prompt("Thank you for playing! Goodbye")
