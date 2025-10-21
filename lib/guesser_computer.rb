require_relative "guesser"
require_relative "check"
# A subclass that manages the computer who is guessing the secret code.
class ComputerGuesser < Guesser
  include Check
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
      # return black and white pegs counts for feedback
      guess_feedback = check_guess(code, guess)
      true if guess_feedback != feedback_hash
    end
  end
end
