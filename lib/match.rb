require_relative "maker"
require_relative "maker_human"
require_relative "maker_computer"
require_relative "guesser"
require_relative "guesser_human"
require_relative "guesser_computer"

# Class that manages the game flow.
class Match
  attr_reader :colors_list

  def initialize
    @colors_list = %w[RED BLUE YELLOW GREEN PURPLE ORANGE]
    @storage = []
    @turn_number = 1
    # maker and guesser are chosen by the Player
    choose_roles
    puts "Code will be created by the #{@maker.name}"
    puts "Guess will be made by #{@guesser.name}"
  end

  def choose_roles
    puts "Guesser or Maker?"
    answer = gets.chomp.downcase
    until %w[maker guesser].include?(answer)
      puts "Guesser or Maker?"
      answer = gets.chomp.downcase
    end
    case answer
    when "guesser"
      @guesser = HumanGuesser.new("Player", @colors_list)
      @maker = ComputerMaker.new("Computer", @colors_list)
    when "maker"
      @guesser = ComputerGuesser.new("Computer", @colors_list)
      @maker = HumanMaker.new("Player", @colors_list)
    end
  end

  def play_game
    @secret_code = @maker.make_code
    while @turn_number <= 10
      puts "\n---- TURN:#{@turn_number} ----"
      if single_round == true
        puts "You found the code. Congratulations!"
        return
      end
      @turn_number += 1
      puts "---- Previous guess ----"
      @storage.each { |guess| p guess }
    end
    puts "Time is up! You lost"
  end

  def single_round
    guess = @guesser.make_guess
    @storage.append(guess)
    return true if is_equal?(@secret_code, guess)

    result = check_guess(@secret_code, guess)
    feedback(result)
  end

  def is_equal?(code, guess)
    # check the equality of the strings
    code == guess
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
    # simply prints guess result in the terminal
    puts "---- Result ----"
    puts "Black pegs: #{result[:black]}"
    puts "White pegs: #{result[:white]}"
  end
end
