require_relative "maker"
# A subclass that manages the computer creating the secret code
class ComputerMaker < Maker
  def make_code
    code_list = Array.new(4) { @colors_list.sample }
    # TO DO: delete the puts statement once game is done
    puts "#{@name} chose the code #{code_list}"
    code_list
  end
end
