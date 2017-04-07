class Array
  def my_uniq
    arr = []
    each do |el|
      arr << el unless arr.include?(el)
    end
    arr
  end

  def two_sum
    indexis = []
    each.with_index do |el, i|
      each.with_index do |el2, i2|
        if i2 > i && el + el2 == 0
          indexis << [i, i2]
        end
      end
    end
    indexis
  end

  def my_transpose
    raise "Not a square array" unless all? { |row| row.length == length }
    transposed = []
    i = 0
    while i < self.length
      sub_array = []
      each { |el| sub_array << el[i] }
      transposed << sub_array
      i += 1
    end
    transposed
  end
end

def stock_picker(arr)
  raise "Array too short" if arr.length < 2
  best_pair = []

  dup = arr.dup.sort
  answer = false
  until answer
    lowest = arr.index(dup[0])
    highest = arr.index(dup[-1])

    if lowest < highest
      best_pair = [dup[0], dup[-1]]
      answer = true
    else
      dup.shift
    end
  end

  best_pair
end

class Game
  attr_accessor :towers

  def initialize
    @towers = [[3, 2, 1], [], []]
  end

  def move(from, to)
    to << from.pop
  end

  def play
    until won?
      from = gets.chomp
      to = gets.chomp
      move(from, to)

    end
  end

  def won?
    towers[1].length == 3 || towers[2].length == 3
  end
end
