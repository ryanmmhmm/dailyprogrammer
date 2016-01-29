require './test_helper'
require '250_sdn.rb'

class TestSDN < Minitest::Test

  def setup
    @input = SelfDescriptiveNumber.new("120")
  end

  def test_that_program_accepts_input
    assert_equal("120", @input.number)
  end

end
