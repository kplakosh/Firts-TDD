require 'tdd'
require 'rspec'
require 'byebug'

describe '#my_uniq' do
  subject(:arr) { [1, 2, 3, 3, 4, 4] }

  it 'can be called on an array' do
    expect { arr.my_uniq }.to_not raise_error
  end

  it 'removes duplicates from an array' do
    expect(arr.my_uniq).to eq([1, 2, 3, 4])
  end

  it 'returns a new array' do
    expect(arr.my_uniq).not_to be(arr)
  end
end

describe '#two_sum' do
  subject(:arr) { [-1, 0, 2, -2, 1] }

  it 'return an array of pair' do
    expect(arr.two_sum[0].length).to eq(2)
  end

  it 'returns an array that is sorted' do
    expect(arr.two_sum).to eq(arr.two_sum.sort)
  end

  it 'return indexis of numbers that sum to 0' do
    expect(arr.two_sum).to eq([[0, 4], [2, 3]])
  end
end

describe "#my_transpose" do
  subject(:arr) { [[0, 1, 2], [3, 4, 5], [6, 7, 8]] }

  it 'represents two-dimensional grid' do
    expect(arr.my_transpose.length).to eq(3)
  end

  it 'all elements are numbers' do
    flattened = arr.my_transpose.flatten
    expect(flattened.all? { |x| x.is_a?(Integer) }).to eq(true)
  end

  it 'returns a transposed array' do
    expect(arr.my_transpose).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
  end

  context 'call my_transpose on a jagged array' do
    subject(:arr) { [[0, 1, 2], [3, 4, 5, 5], [6, 8]] }

    it 'raises an error if the array is not square' do
      expect { arr.my_transpose }.to raise_error('Not a square array')
    end
  end
end

describe "#stock_picker" do
  subject(:arr) { [5, 3, 6, 4, 10, 2] }

  it 'will not raise an error if given an array' do
    expect { stock_picker(arr) }.to_not raise_error
  end

  it 'checks if it subtracts the correct way' do
    expect(stock_picker(arr)).to_not eq([10, 2])
  end

  it 'returns the correct value' do
    expect(stock_picker(arr)).to eq([3, 10])
  end

  context "Not enought information" do
    subject(:arr) { [] }

    it 'raise an error if array length is less than 2' do
      expect { stock_picker(arr) }.to raise_error("Array too short")
    end
  end
end

describe "#towers_of_hanoi" do
  subject(:game) { Game.new }

  it "Initializes three piles" do
    expect(game.towers).to eq([[3, 2, 1], [], []])
  end

  describe "#move" do
    before(:each) { game.move(game.towers[0], game.towers[1]) }

    it "Subtracting from initial pile" do
      expect(game.towers[0].length).to eq(2)
    end

    it "Add to receiving pile" do
      expect(game.towers[1].length).to eq(1)
    end
  end

  describe "#won?" do
    it "return true ones all the discs are moved" do
      game.towers = [[], [3, 2, 1], []]
      expect(game.won?).to eq(true)
    end
  end
end
