require_relative "guesser"
# A subclass that manages the computer who is guessing the secret code.
class ComputerGuesser < Guesser
  def make_guess
    # pick 4 random colors and return them
    Array.new(4) { @colors_list.sample }
  end
end
