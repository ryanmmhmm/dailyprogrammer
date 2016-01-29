
class SelfDescriptiveNumber

  attr_reader :number, :individual_numbers

  def initialize(number)
    @number = number
    @individual_numbers = split_numbers_into_array
  end

  def split_numbers_into_array
    if @number.is_a?(Integer)
      @individual_numbers = @number.to_s
    else
      @individual_numbers = @number
    end

    @individual_numbers.split('')
  end

end
