require_relative "guesser"
# A subclass that manages the human player who is guessing the secret code.
class HumanGuesser < Guesser
  def make_guess
    # initialize the empty list of guesses
    guess_list = []
    # Ask to pick the colors and check that no more and no less than 4 are inside.
    # Also check if all colors inside guess_list are included in the original color_list
    until guess_list.count == 4 && guess_list.all? { |color| @colors_list.include?(color) }
      puts "Please #{@name}, pick four colors from #{@colors_list}. Order matters. Choose...wisely!"
      # get the answer from the player
      color = gets.chomp.upcase
      # split the string into an array and pass it to guess_list
      guess_list = color.split
    end
    # if picks are accepted, give feedback
    puts "Guess accepted. Your picks are #{guess_list}. Good Luck!"
    # return the guesses
    guess_list
  end
end
