# A class that manages the secret code creator. It takes a name and choose the colors combination
class Maker
  attr_reader :name

  def initialize(name, list)
    @name = name
    @colors_list = list
  end

  def make_code
    raise NotImplementedError,
          "This is a parent class. A subclass like HumanMaker must implement its own 'make_code' method."
  end
end
