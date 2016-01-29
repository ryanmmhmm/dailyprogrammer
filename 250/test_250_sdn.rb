require './test_helper'
require '250_sdn.rb'

class TestSDN < Minitest::Test

  def setup
    @input = SelfDescriptiveNumber.new(120)
  end

  def test_that_program_accepts_input
    assert_equal(120, @input.number)
  end

  def test_that_number_split_into_array_of_numbers
    assert_equal([1, 2, 0], @input.individual_numbers)
  end

  def test_that_sum_is_correct
    assert_equal(3, @input.sum)
  end

  def test_that_sdn_min_range_matches_input
    assert_equal(100, @input.min_range)
  end

  def test_that_sdn_max_range_matches_input
    assert_equal(333, @input.max_range)
  end

end
