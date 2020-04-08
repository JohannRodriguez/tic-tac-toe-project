# Get the player movement and procces it to se if it's valid
class PlayerMoveInput
  @@valid_moves = %w[1 2 3 4 5 6 7 8 9]
  def validate_move(player_mark, modified_grid, player_1_name, player_2_name)
    valid_move = false
    @@valid_moves.length.times do |n|
      if player_mark == @@valid_moves[n]
        valid_move = true
        @@valid_moves.delete(player_mark)
        CheckGameOn.new.player_move_save(player_mark, player_1_name, player_2_name, @@valid_moves)
        move_print(player_mark, modified_grid)
        UserDisplay.new.wich_turn(player_1_name, player_2_name) if $game_on
        return UserDisplay.print_board(modified_grid)
      end
    end
    unless valid_move
      UserDisplay.new.invalid_move  if $game_on
      UserDisplay.new.wich_turn(player_1_name, player_2_name) if $game_on
      UserDisplay.print_board(modified_grid) if $game_on
    end
  end

  def move_print(player_mark_print, modified_grid_print)
    player_turn_print = 'X' if $current_turn.even?
    player_turn_print = 'O' if $current_turn.odd?
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
