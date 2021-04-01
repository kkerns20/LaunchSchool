=begin

Write a minitest assertion that will fail if value.downcase does not return 'xyz'.

=end

require 'minitest'

class TestDowncase < Minitest::Test
  def setup
    x = 'XYZ'
  end

  def test_downcase
    assert_equal 'xyz', x.downcase
  end
end
