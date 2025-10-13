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

  def play_game
    @secret_code = @maker.make_code
    single_round
  end

  def single_round
    guess = @guesser.make_guess
    is_equal?(@secret_code, guess)
    result = check_guess(@secret_code, guess)
    feedback(result)
  end

  def is_equal?(code, guess)
    # check the equality of the strings
    if code == guess
      puts "You found the code. Congratulations!"
      true
    else
      false
    end
  end

  def check_guess(code, guess)
    # initialiye the counts and duplicate the original arrays to avoid changing them
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

  def feedback(result)
    puts "Black pegs: #{result[:black]}"
    puts "White pegs: #{result[:white]}"
  end
end

match = Match.new
match.play_game
