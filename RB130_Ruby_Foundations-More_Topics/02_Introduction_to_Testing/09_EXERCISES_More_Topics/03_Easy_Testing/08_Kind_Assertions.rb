=begin

Write a minitest assertion that will fail if the class of value is not Numeric or one of Numeric's subclasses (e.g., Integer, Float, etc).

=end

require 'minitest'

class TestSubclass < Minitest::Test
  def setup
    value = Integer.new
  end

  def test_subclass
    assert_include Numeric.subclasses, value.class
  end
end
