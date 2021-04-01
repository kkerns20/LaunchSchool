=begin

Write a test that will fail if list and the return value of list.process are different objects.

=end

require 'minitest'

class TestSameObject < Minitest::Test
  def setup
    class Listy
      def process
        "other"
      end
    end

    list = Listy.new
  end

  def test_same_object
    assert_same list, list.process
  end
end
