# A class that manages the player who creates the secret code. It takes a name and choose the colors combination
class Maker
  def initialize(name)
    @name = name
    @colors_list = %w[RED BLUE YELLOW GREEN PURPLE ORANGE]
  end

  def make_code
    # Pick 4 random colors and add it to a new list
    @colors_list.sample(4)
    # return the list
  end
end
