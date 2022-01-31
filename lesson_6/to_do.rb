def computer_places_piece!(brd)
  square = nil

  # offense
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

  # random
  if !square
    square = choose_random_square(brd)
  end

  brd[square] = COMPUTER_MARKER
end
