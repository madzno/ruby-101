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
    card = deck.sample
    cards << card
    deck.delete(card)
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
  value = card[1]

  if value == 'A' && totals[current_player_key] > 21
    totals[current_player_key] += 1
  elsif value == 'A' && totals[current_player_key] <= 21
    totals[current_player_key] += 11
  elsif value.to_i == 0
    totals[current_player_key] += 10
  else
    totals[current_player_key] += value.to_i
  end
end

def players_turn(deck, totals)
  loop do
    prompt("Choose: 'hit' or 'stay'")
    answer = gets.chomp
    if answer == 'hit'
       totals[PLAYERS_KEY] = hit(deck, totals)
    elsif answer == 'stay' || busted?
      break
    elsif answer != ('hit' || 'stay')
      prompt("Sorry, not a valid choice please enter 'hit' or 'stay'")
    end
  end
  totals[PLAYERS_KEY]
end

def hit(deck, totals)
  card = get_random_card!(deck)
  update_total!(card, PLAYERS_KEY, totals)
  p card
  p totals
end


totals = initalize_totals
deck = initalize_deck

players_cards = deal_cards!(deck)
dealers_cards = deal_cards!(deck)

display_dealers_card(dealers_cards)
display_players_cards(players_cards)

players_starting_total = inital_total!(players_cards, PLAYERS_KEY, totals)
dealers_starting_total = inital_total!(dealers_cards, DEALERS_KEY, totals)

p players_cards
p players_starting_total

p dealers_cards
p dealers_starting_total

p totals

players_turn(deck, totals)

p totals
