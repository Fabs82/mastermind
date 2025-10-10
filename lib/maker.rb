# A class that manages the player who creates the secret code. It takes a name and choose the colors combination
class Maker
  def initialize(name, list)
    @name = name
    @colors_list = list
  end

  def make_code
    # Pick 4 random colors and  return the list
    code_list = @colors_list.sample(4)
    # TO DO: delete the puts statement once game is done
    puts "#{@name} chose #{code_list}"
    code_list
  end
end
