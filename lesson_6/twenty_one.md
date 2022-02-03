- Outside of loop; initalize a hash to keep track
of the dealers and the players scoreboard

- loop layer # 1;
- welcome messages [x]
- initalize deck [x]
.........- multidimensional array where sub_array[0] represents suit and sub_array[1] represents value

- deal two cards to each player and delete those cards from the deck
..- dealers_cards = deal_cards!
..- players_cards = deal_cards!


- Display one of the dealers cards
- Display both of the users cards

loop layer #2
- Player's turn
- initalize a variable players turn = ''
loop layer #3
..- Ask the player if they want to hit or stay
..- re-assign the value 'hit' or 'stay' to the players_turn variable
..- if input is not hit or stay it is not valid and ask again
..- break out of asking the player if the player types hit or stay
..- end loop layer#3 with the new players_turn variable

..- if players_turn = 'hit'
.....- deal one random card to the player
......- 'pop' one card off of the deck and add it to a variable 'card'
......- add the variable 'card' to the array players_cards

......- add the value of `card` to the players overall value total in the totals hash

.....- if their updated total is > 21
.....- display that their their total is > 21 and they are busted
.....- break out of the player's turn loop

.....- if their updated total is <= 21
.....- display their updated deck and updated total
....- ask them again if they want to hit or stay (go to the beginning of the loop)

..... if players_turn = 'stay'
..... display to them that they chose to stay and break out of the players loop

....if player busted do not continue to dealers turn, just ask the player if they
want to play again
....- if yes go back to the start of the loop, skipping the dealers turn and
everything after
....- if no break out of the overall loop and say goodbye

..... if players 'stayed'
..... display 'Dealers turn now..." and move on to the dealers portion of the loop

..-dealers turn
..- if the dealers total is >= 17 break
...- if the dealers total is < 17
...-.- 'pop' one card off of the deck and add it to a variable 'card'
...- add the value of that card to the players overall total
..- check the total if it is >= 17 break
...- if it is > 21 display that the player has one and break out of the
overall loop to the good bye messages

..- display the results
..- display dealers cards are : and total is:
..- display players cards are : and total is:
..- if dealers totals > players totals
..- dealer wins!
...-else
...- player wins!
..-end

..play again?


