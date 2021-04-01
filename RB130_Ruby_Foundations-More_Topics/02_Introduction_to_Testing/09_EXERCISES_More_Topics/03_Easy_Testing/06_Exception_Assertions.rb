=begin

Write a minitest assertion that will fail unless employee.hire raises a NoExperienceError exception.

=end

requires 'minitest'

class TestRaisesNoExperience < Minitest::Test
  def setup
    class Employee
      def hire
        raise NoExperienceError
      end
    end

    class NoExperienceError < StandardError; end

    employee = Employee.new
  end

  assert_raises NoExperienceError do
    employee.hire
  end
end
