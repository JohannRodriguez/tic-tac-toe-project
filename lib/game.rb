module Enumerable
  def input_validation(player_name_1 = nil, print = true, player_number)
      if self.empty?
        return p "Your name can't be empty, try to type a diferent one for player #{player_number}" if print
      elsif self.join == player_name_1
        return p "You can't choose the same name as #{player_name_1}, try to type a diferent one for player #{player_number}" if print
      elsif self.all?(' ')
        return p "Your must have at least one visible character, try to type a diferent one for player #{player_number}" if print
      else
        return true
      end
  end

  def array_include?(arg)
    arg.length.times do |n|
      return false unless self.include?(arg[n])
    end
    true
  end
end

class User_display
  def self.print_board(grid)
    p "********************"
    grid.length.times { |n| p grid[n] }
    p "********************"
  end

  def wich_turn(player_1_name, player_2_name)
    player_turn_name = player_1_name if $current_turn.even?
    mark = "X" if $current_turn.even?
    player_turn_name = player_2_name if $current_turn.odd?
    mark = "O" if $current_turn.odd?
    p "It's #{player_turn_name}'s turn' ('#{mark}'), make your move:"
  end
end

class Player_move_input
  @@valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
  def validate_move(player_mark, modified_grid, player_1_name, player_2_name)
    valid_move = false
    @@valid_moves.length.times do |n|
      if player_mark == @@valid_moves[n]
        valid_move = true
        @@valid_moves.delete(player_mark)
        Check_game_on.new.draw(@@valid_moves)
        Check_game_on.new.player_move_save(player_mark)
        Check_game_on.new.win(player_1_name, player_2_name)
        move_print(player_mark, modified_grid)
        User_display.new.wich_turn(player_1_name, player_2_name) if $game_on
        return User_display.print_board(modified_grid)
      end
    end
    unless valid_move
      p "That's not a valid move, try again" if $game_on
      User_display.new.wich_turn(player_1_name, player_2_name) if $game_on
      User_display.print_board(modified_grid) if $game_on
    end
  end

  def move_print(player_mark_print, modified_grid_print)
    player_turn_print = "X" if $current_turn.even?
    player_turn_print = "O" if $current_turn.odd?
    modified_grid_print.each do |sub_array|
      sub_array.length.times do |n|
        if player_mark_print == sub_array[n]
          sub_array[n] = player_turn_print
          $current_turn += 1
          return modified_grid_print
        end
      end
    end
  end
end

class Check_game_on
  @@winning_cases = [["1","2","3"], ["4","5","6"], ["7","8","9"], ["1","4","7"], ["2","5","8"], ["3","6","9"], ["1","5","9"], ["3","5","7"]]
  @@player_1_moves = []
  @@player_2_moves = []
  def player_move_save(player_input)
    @@player_1_moves.push(player_input) if $current_turn.even?
    @@player_2_moves.push(player_input) if $current_turn.odd?
  end

  def draw(no_moves)
    $game_on = false if no_moves.length == 0
  end

  def win(player_1, player_2)
    8.times do |n|
      if @@player_1_moves.array_include?(@@winning_cases[n])
        p "#{player_1} wins!"
        $game_on = false
      end
      if @@player_2_moves.array_include?(@@winning_cases[n])
        p "#{player_2} wins!"
        $game_on = false
      end
    end
  end
end
