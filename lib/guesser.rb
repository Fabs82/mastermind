# A class that manages the player who is guessing the secret code. It takes a name as an argument and choose the colors to make the guess
class Guesser
  def initialize(name, list)
    @name = name
    @colors_list = list
  end

  def make_guess
    # initialize the empty list of guesses
    guess_list = []
    # Ask to pick a color and check that no more and no less than 4 colors are inside.
    # Also check if all teh color inside guess_list are included in the original color_list
    until guess_list.count == 4 && guess_list.all? { |color| @colors_list.include?(color) }
      puts "Please #{@name}, pick four colors from #{@colors_list}. Order matters. Choose...wisely!"
      # get the answer from the player
      color = gets.chomp.upcase
      # spit the string into ana array and pass it to guess_list
      guess_list = color.split
    end
    # if picks are accepted, give feedback
    puts "Guess accepted. Your pick are #{guess_list}. Good Luck!"
    # return the guesses
    guess_list
  end
end
