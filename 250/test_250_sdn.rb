require './test_helper'
require '250_sdn.rb'

class TestSDN < Minitest::Test

  def setup
    @input_range_3 = InputRange.new(3)
    @input_range_4 = InputRange.new(4)
    @input = SelfDescriptiveNumber.new(120)
    @real_sdn = SelfDescriptiveNumber.new(1210)
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

  def test_that_input_range_exists
    assert_equal(3, @input_range_3.range)
  end

  def test_that_input_range_high_is_equal
    assert_equal(999, @input_range_3.high)
  end

  def test_that_input_range_low_is_equal
    assert_equal(100, @input_range_3.low)
  end

  def test_that_input_range_low_is_correct
    assert_equal(1000, @input_range_4.low)
  end

  def test_that_input_range_high_is_correct
    assert_equal(9999, @input_range_4.high)
  end

  def test_that_an_sdn_is_computed_to_be_an_sdn
    assert_equal(@real_sdn.number, @real_sdn.check_if_sdn)
  end

end
