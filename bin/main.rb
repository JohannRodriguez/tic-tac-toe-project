require_relative '../lib/game.rb'
# !/usr/bin/env ruby

board = [' 1 | 2 | 3 ', ' 4 | 5 | 6 ', ' 7 | 8 | 9 ']
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
