# imports
require 'pry'

# constants

SUITS = ['H', 'D', 'C', 'S']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

VALUES_DISPLAY_NAMES = {  'J' => 'Jack',
                          'Q' => 'Queen',
                          'K' => 'King',
                          'A' => 'Ace'}

PLAYERS_KEY = :player
DEALERS_KEY = :dealer
# methods

def prompt(message)
 puts "=> #{message}"
end

def initalize_deck
  SUITS.product(VALUES).shuffle
end

def initalize_totals
  { PLAYERS_KEY => 0, DEALERS_KEY => 0 }
end

def welcome_messages
  prompt("Welcome to Twenty-One")
  rules = <<-MSG
  The rules of Twenty-One:
        - The goal of Twenty-One is to get as close to 21 without going over
        - The game conists of the player and dealer, both get 2 cards
        - The player (you) can only see one of the dealers cards
        - Numbered cards are worth their face value
        - Jacks, Queens, and Aces are worth 10 points
        - An ace can be worth 1 or 11 points
        - Remember to not go over 21 points, or its a bust!
        MSG
  prompt("#{rules}")
  sleep(6)
  system 'clear'
end

def deal_cards!(deck)
  cards = []
  2.times do |card|
    cards << deck.pop
  end
  cards
end

def get_random_card!(deck)
  card = deck.sample
  deck.delete(card)
  card
end

def display_dealers_card(dealers_cards)
  card_to_display = dealers_cards.sample
  name_to_display = if card_to_display[1].to_i == 0
                       VALUES_DISPLAY_NAMES[card_to_display[1]]
                     else
                        card_to_display[1]
                     end
  prompt("Dealer has: #{name_to_display} and unknown card")
end

def display_players_cards(players_cards)
  card_one_display = if players_cards[0][1].to_i == 0
                        VALUES_DISPLAY_NAMES[players_cards[0][1]]
                     else
                        players_cards[0][1]
                      end
  card_two_display = if players_cards[1][1].to_i == 0
                        VALUES_DISPLAY_NAMES[players_cards[1][1]]
                     else
                        players_cards[1][1]
                     end
  prompt("You have: #{card_one_display} and #{card_two_display}")
end

def inital_total!(cards, current_player_key, totals)
  values = cards.map { |sub_array| sub_array[1] }

  values.each do |value|
    if value == "A"
      totals[current_player_key] += 11
    elsif value.to_i == 0
      totals[current_player_key] += 10
    else
      totals[current_player_key] += value.to_i
    end
  end

  values.select { |value| value == 'A'}.count.times do |sum|
    totals[current_player_key] -= 10 if totals[current_player_key] > 21
  end

  totals[current_player_key]
end

def update_total!(card, current_player_key, totals)
  if card[1] == 'A' && totals[current_player_key] > 21
    totals[current_player_key] += 1
  elsif card[1] == 'A' && totals[current_player_key] <= 21
    totals[current_player_key] += 11
  elsif card[1].to_i == 0
    totals[current_player_key] += 10
  else
    totals[current_player_key] += card[1].to_i
  end

  totals
end

def busted?(totals)
  totals[PLAYERS_KEY] > 21
end

totals = initalize_totals

loop do

  welcome_messages

  # variable assignment
  deck = initalize_deck

  players_cards = deal_cards!(deck)
  dealers_cards = deal_cards!(deck)

  display_players_cards(players_cards)
  display_dealers_card(dealers_cards)

  players_starting_total = inital_total!(players_cards, PLAYERS_KEY, totals)
  dealers_starting_total = inital_total!(dealers_cards, DEALERS_KEY, totals)

  loop do

    players_choice = ''

    loop do
      prompt("Choose hit or stay")
      players_choice = gets.chomp.downcase
      break if ['hit', 'stay'].include?(players_choice)
      prompt "Sorry, must enter 'hit' or 'stay'"
    end

    if players_choice == 'hit'
      card = deck.pop
      players_cards << card
      update_total!(card, PLAYERS_KEY, totals)
      if totals[PLAYERS_KEY] > 21
        prompt("Sorry, you're total is over 21. Dealer wins!")
        break
      else
        prompt("Your cards are #{players_cards} and total is #{totals[PLAYERS_KEY]}")
      end
    end

    if players_choice == 'stay'
      prompt("You chose to stay")
      break
    end

    break if totals[PLAYERS_KEY] > 21
  end
end

#   prompt("Dealers turn now...")

#   loop do
#     break if totals[DEALERS_KEY] >= 17
#     card = deck.pop
#     dealers_cards << card
#     update_total!(card, DEALERS_KEY, totals)
#   end


#   if totals[DEALERS_KEY] > 21
#     prompt("Dealer is over 21. Player wins!")
#     break
#   end

# end

p players_cards
p dealers_cards

p totals
