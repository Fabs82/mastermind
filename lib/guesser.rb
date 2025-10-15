# A class that manages the secret code guesser. It takes a name as an argument and choose the colors to make the guess
class Guesser
  attr_reader :name

  def initialize(name, list)
    @name = name
    @colors_list = list
  end

  def make_guess
    raise NotImplementedError,
          "This is a parent class. A subclass like HumanGuesser must implement its own 'make_guess' method."
  end
end
