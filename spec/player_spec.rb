# spec/player_spec.#!/usr/bin/env ruby -wKU
require './lib/player.rb'

describe PlayerMoveInput do
  let(:player) { PlayerMoveInput.new }
  let(:board) { [' 1 | 2 | 3 ', ' - + - + - ', ' 4 | 5 | 6 ', ' - + - + - ', ' 7 | 8 | 9 '] }
  describe '#player_move_save' do
    it 'Returns the board changed if the mark is equal to a valid number' do
      expect(player.move_print('1', board)).to eql([' X | 2 | 3 ', ' - + - + - ', ' 4 | 5 | 6 ', ' - + - + - ', ' 7 | 8 | 9 '])
    end
  end

  describe '#validate_move' do
    it 'Gets nil if the input is invalid' do
      expect(player.validate_move('x', board, 'Mario', 'Luigi')).to eql(nil)
    end
  end
end
