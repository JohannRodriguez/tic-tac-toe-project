require_relative '../lib/game.rb'
require_relative '../lib/enumerables.rb'
require_relative '../lib/player.rb'
# !/usr/bin/env ruby

board = [' 1 | 2 | 3 ', ' - + - + - ', ' 4 | 5 | 6 ', ' - + - + - ', ' 7 | 8 | 9 ']
$current_turn = 0
$game_on = true

# To get tha player name and see if it can be used
class PlayerNameInput
  def name_input(player, player_1 = nil)
    p "Enter a name for player #{player}:"
    check = false
    while check == false
      player_name = gets.chomp
      player_name.split('').input_validation(player_1, true, player)
      check = true if player_name.split('').input_validation(player_1, false, player) == true
    end
    player_name
  end
end

# print boars for the user to see
class UserDisplay
  def self.print_board(grid)
    p '********************'
    grid.length.times { |n| p grid[n] }
    p '********************'
  end

  def wich_turn(player_1_name, player_2_name)
    player_turn_name = player_1_name if $current_turn.even?
    mark = 'X' if $current_turn.even?
    player_turn_name = player_2_name if $current_turn.odd?
    mark = 'O' if $current_turn.odd?
    p "It's #{player_turn_name}'s turn' ('#{mark}'), make your move:"
  end

  def is_a_draw
    p "It's a draw, no winners"
  end

  def player_win(winer)
    p "#{winer} wins! Great match"
  end

  def invalid_move
    p "That's not a valid move, try again"
  end
end

confirm_name = 'n'
player_1 = ''
player_2 = ''

p 'First, input a name for each player. Spaces in the name will be deleted'
p '**********************'

while confirm_name == 'n'
  player_1 = PlayerNameInput.new.name_input('1')
  p '********************************'
  p "Player 1 name is #{player_1}!"
  p "Is the name correct? type 'n' to correct or hit enter to continue"
  confirm_name = gets.chomp
end
confirm_name = 'n'
while confirm_name == 'n'
  player_2 = PlayerNameInput.new.name_input('2', player_1)
  p '********************************'
  p "Player 2 name is #{player_2}!"
  p "Is the name correct? type 'n' to correct or hit enter to continue"
  confirm_name = gets.chomp
end

UserDisplay.new.wich_turn(player_1, player_2)
UserDisplay.print_board(board)

while $game_on
  player_move = gets.chomp.delete(' ')
  p PlayerMoveInput.new.validate_move(player_move, board, player_1, player_2)
end
