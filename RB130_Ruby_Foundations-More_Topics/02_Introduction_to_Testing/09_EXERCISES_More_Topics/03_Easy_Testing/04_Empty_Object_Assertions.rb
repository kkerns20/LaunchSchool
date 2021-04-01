=begin

Write a minitest assertion that will fail if the Array list is not empty.

=end

require 'minitest'

class TestEmpty < Minitest::Test
  def setup
    x = [1,2,3]
  end

  def test_empty
    assert x.empty?
  end
end
