=begin

Write a minitest assertion that will fail if the value.odd? is not true.

=end

require 'minitest'

class TestOdd < Minitest::Test
  def setup
    x = 4
  end

  def test_odd
    assert x.odd?
  end
end
