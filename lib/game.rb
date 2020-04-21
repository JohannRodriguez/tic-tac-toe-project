# lib/game.rb

# check to see if the game should be on or off
class CheckGameOn
  @@winning_cases = [%w[1 2 3], %w[4 5 6], %w[7 8 9], %w[1 4 7], %w[2 5 8], %w[3 6 9], %w[1 5 9], %w[3 5 7]]
  @@player_1_moves = []
  @@player_2_moves = []
  def player_move_save(player_input, player_1_name, player_2_name, valid_moves)
    current_turn = 0
    @@player_1_moves.push(player_input) if current_turn.even?
    @@player_2_moves.push(player_input) if current_turn.odd?
    win(player_1_name, player_2_name, valid_moves)
    [@@player_1_moves, @@player_2_moves]
  end

  def draw(no_moves)
    $game_on = false if no_moves.length.zero?
    return "It's a draw, no winners" if no_moves.length.zero?
  end

  def win(player_1, player_1_moves = @@player_1_moves, player_2_moves = @@player_2_moves, player_2, valid_moves)
    @@make_draw = true
    8.times do |n|
      if player_1_moves.array_include?(@@winning_cases[n])
        $game_on = false
        @@make_draw = false
        return "#{player_1} wins! Great match"
      end
      if player_2_moves.array_include?(@@winning_cases[n])
        $game_on = false
        @@make_draw = false
        return "#{player_2} wins! Great match"
      end
    end
    draw(valid_moves) if @@make_draw
  end
end
