require_relative "maker"
require_relative "guesser"

# Class that manages the game flow.
class Match
  attr_reader :colors_list

  def initialize
    @colors_list = %w[RED BLUE YELLOW GREEN PURPLE ORANGE]
    @maker = Maker.new("Computer", @colors_list)
    @guesser = Guesser.new("Player", @colors_list)
  end

  def round
    @maker.make_code
    @guesser.make_guess
  end
end

match = Match.new
match.round
