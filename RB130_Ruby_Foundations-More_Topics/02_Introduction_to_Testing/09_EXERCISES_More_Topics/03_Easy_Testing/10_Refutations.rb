=begin

Write a test that will fail if 'xyz' is one of the elements in the Array list:

=end

require 'minitest'

class RefuteInclusion < Minitest::Test
  def setup
    list = [1,2,'xyz']
  end

  def test_include
    refute_includes list, 'xyz'
  end
end
