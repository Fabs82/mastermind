require_relative "guesser"
# A subclass that manages the computer who is guessing the secret code.
class ComputerGuesser < Guesser
  def initialize(name, list)
    super(name, list)
    # the array include the 1296 combiations of the 6 colors in 4 position
    @possibilities_array = @colors_list.repeated_permutation(4).to_a
  end

  def make_guess
    # pick 4 random colors and return them
    sleep(1.2)
    guess = @possibilities_array.sample
    puts "Computer chose #{guess}"
    guess
  end

  def process_feedback(guess, feedback_hash)
    # use the guess against the combination and check which ones would have the same result (black pegs, white pegs) of the guess
    @possibilities_array.reject! do |code|
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
      guess_feedback = { black: black_peg, white: white_peg }
      true if guess_feedback != feedback_hash
    end
  end
end
