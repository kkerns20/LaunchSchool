=begin

Write a minitest assertion that will fail if value is not nil.

=end

require 'minitest'

class TestNil < Minitest::Test
  def setup
    x = nil
  end

  def test_nil
    assert_nil x
  end
end
