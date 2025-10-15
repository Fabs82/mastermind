require_relative "maker"
# A subclass that manages the player creating the secret code
class HumanMaker < Maker
  def make_code
    code_list = []
    # Ask to pick the colors and check that no more and no less than 4 are inside.
    # Also check if all the colors inside the_list are included in the original color_list
    until code_list.count == 4 && code_list.all? { |color| @colors_list.include?(color) }
      puts "Please #{@name}, pick four colors from #{@colors_list}."
      # get the answer from the player
      color = gets.chomp.upcase
      # split the string into an array and pass it to code_list
      code_list = color.split
    end
    # if picks are accepted, give feedback
    puts "Code accepted Your picks are #{code_list}."
    # return the secret code
    code_list
  end
end
