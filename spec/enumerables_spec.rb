# spec/enumerables_spec.rb
require './lib/enumerables.rb'

describe Enumerable do
  let(:test_array) { [1, 5, 8, 3, 9] }
  describe '#input_validation' do
    it 'Returns certain message if the name given string is not valid' do
      expect(''.split('').input_validation(nil, true, 1)).to be_kind_of(String)
    end
    it 'Returns true if the given string is valid' do
      expect('Mario'.split('').input_validation(nil, true, 1)).to eql(true)
    end
  end
  describe '#array_inlcude?' do
    it 'Returns true if all items of the argument are inside the array' do
      expect(test_array.array_include?([3, 1, 9])).to eql(true)
    end
    it 'Returns false if one of the items of the argument is missing in the array' do
      expect(test_array.array_include?([3, 7, 9])).to eql(false)
    end
  end
end
