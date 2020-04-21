# spec/game_spec.#!/usr/bin/env ruby -wKU
require './lib/game.rb'
require './lib/enumerables.rb'

describe CheckGameOn do
  let(:game) { CheckGameOn.new }

  describe '#player_move_save' do
    it 'Returns two arrays with the inputs of the player moves depending on the turn' do
      expect(game.player_move_save('1', 'Mario', 'Luigi', %w[1 2 3])).to eql([['1'], []])
    end
  end

  describe '#draw' do
    it 'it displays a message if the passed array is empty' do
      expect(game.draw([])).to be_kind_of(String)
    end
    it 'Returns nil if the passed argumeent has items' do
      expect(game.draw(['1'])).to eql(nil)
    end
  end

  describe '#win' do
    it 'Returns nil if none of the arrays makes the conditions' do
      expect(game.win('Mario', ['1'], ['2'], 'Luigi', ['1'])).to eql(nil)
    end
    it 'Returns a message if one of the arrays meets the conditions' do
      expect(game.win('Mario', %w[1 2 3], ['2'], 'Luigi', ['1'])).to eql('Mario wins! Great match')
    end
  end
end
