# lib/enumerables.rb

# Modules for the array include and validate inputs
module Enumerable
  def input_validation(player_name_1 = nil, print = true, player_number)
    if empty?
      return p "Your name can't be empty, try to type a diferent one for player #{player_number}" if print
    elsif join == player_name_1
      return p "You can't choose the same name as #{player_name_1}, try to type a diferent one for player #{player_number}" if print
    elsif all?(' ')
      return p "Your must have at least one visible character, try to type a diferent one for player #{player_number}" if print
    else
      true
    end
  end

  def array_include?(arg)
    arg.length.times do |n|
      return false unless include?(arg[n])
    end
    true
  end
end
