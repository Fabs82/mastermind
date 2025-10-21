# The logic that checks the guesses and counts black and white pegs
module Check
  def check_guess(code, guess)
    # initialize the counts and duplicate the original arrays to avoid changing them
    black_peg = 0
    white_peg = 0
    code_copy = code.dup
    guess_copy = guess.dup
    # loop and check equality for rach index of the code array
    code_copy.each_with_index do |color, index|
      next unless color == guess_copy[index]

      code_copy[index] = "X"
      guess_copy[index] = "Y"
      black_peg += 1
    end
    # loop and check if remaining colors in guess array are included in code array. Returns only the first instance
    guess_copy.each do |color|
      next unless code_copy.include?(color)

      match_index = code_copy.find_index(color)
      code_copy[match_index] = "Z"
      white_peg += 1
    end
    # return black and white pegs counts for feedback
    { black: black_peg, white: white_peg }
  end
end
