require 'pry'

class SelfDescriptiveNumber

  attr_reader :number, :individual_numbers, :sum, :min_range, :max_range

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

end
