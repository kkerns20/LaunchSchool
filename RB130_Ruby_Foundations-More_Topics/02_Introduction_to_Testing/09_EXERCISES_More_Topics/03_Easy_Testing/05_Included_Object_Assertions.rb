=begin

Write a minitest assertion that will fail if the 'xyz' is not in the Array list.

=end

require 'minitest'

class TestInclusion < Minitest::Test
  def setup
    x = [1,2,3]
  end

  def test_inclusion
    assert_includes x, 'xyz'
  end
end
