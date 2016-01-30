require 'pry'

class SelfDescriptiveNumber

  attr_reader :number, :individual_numbers, :sum, :min_range, :max_range, :build_possible_permutations

  def initialize(number)
    @number = number
    @individual_numbers = split_numbers_into_array
    @sum = sum
    @min_range = min_range
    @max_range = max_range
  end

  def split_numbers_into_array
    if @number.is_a?(Integer)
      @individual_numbers = @number.to_s
    else
      @individual_numbers = @number
    end

    @individual_numbers = @individual_numbers.split('')
    individual_numbers_to_integers
  end

  def individual_numbers_to_integers
    @individual_numbers.map.each do |character|
      character = character.to_i
    end
  end

  def sum
    total = 0
    @individual_numbers.each do |x|
      total = total + x
    end

    total
  end

  def min_range
    minimum = 0.1
    minimum = 0 if @sum == 0

    @sum.times do
      minimum = minimum * 10
    end

    minimum.to_i
  end

  def max_range
    highest = highest_number(@individual_numbers)
    maximum = Array.new
    highest.times do
      maximum << highest
    end

    maximum.join.to_i
  end

  def highest_number(array)
    highest_num = 0
    array.reverse.each.with_index do |value, i|
      if value != 0
        return highest_num = @sum - (i - 1)
      end
    end
  end

  def check_if_sdn
    permutations = build_possible_permutations
    if permutations.include?(@number)
      @number
    else
      false
    end
  end

  def build_possible_permutations
    permutations = Array.new
    @individual_numbers.each_with_index do |number, i|
      number.times do
        permutations << i
      end
    end
    permutations = permutations.permutation.to_a

    permutations.each_with_index do |set, i|
      permutations[i] = set.join.to_i
    end

    permutations
  end

end


class InputRange

  ## Assumes base 10 for input values

  attr_reader :range, :high, :low, :output

  def initialize(range)
    @range = range
    @high = high
    @low = low
    @output = nil

    possible_numbers
  end

  def high
    maximum_range = Array.new
    @range.times do
      maximum_range << 9
    end
    maximum_range.join.to_i
  end

  def low
    minimum_range = 1 * 0.1
    minimum_range = 0 if @range == 0
    @range.times do
      minimum_range = minimum_range * 10
    end
    minimum_range.to_i
  end

  def possible_numbers
    possibilities = (@low..@high).to_a
    possibilities.each do |possibility|
      check_possibility(possibility)
    end
  end

  def check_possibility(possibility)
    possibility = SelfDescriptiveNumber.new(possibility)
    if (possibility.min_range >= @low) && (possibility.max_range <= @high)
      if possibility.check_if_sdn.is_a?(Integer)
        append_output(possibility.number)
      end
    end
  end

  def append_output(found_sdn)
    @output ||= Array.new
    @output << found_sdn
  end

end
