# A class that manages the player who is guessing the secret code. It takes a name as an argument and choose the colors
class Guesser
  def initialize(name)
    @name = name
    # TODO: Refactor @colors_list to be passed in from the Match class.
    @colors_list = %w[RED BLUE YELLOW GREEN PURPLE ORANGE]
  end

  def make_guess
    # initialize the empty list of guesses
    guess_list = []
    # Ask to pick a coloro and check that no more and no less than 4 colors are inside
    until guess_list.count == 4
      puts "Please #{@name}, pick a color #{@colors_list}. Order matters. Choose...wisely!"
      color = gets.chomp.upcase
      # check that the answer is a color in the list
      until @colors_list.include?(color)
        puts "This color is not in the list. Please choose another."
        puts "Pick a color #{@colors_list}. Order matters"
        color = gets.chomp.upcase
      end
      # append the color to the list and gives feedback
      guess_list.append(color)
      p "Your list of guess: #{guess_list}"
    end
    # once 4 colors are picked return the new guess list
    guess_list
  end
end

guesser = Guesser.new("Player One")

guesser.make_guess
