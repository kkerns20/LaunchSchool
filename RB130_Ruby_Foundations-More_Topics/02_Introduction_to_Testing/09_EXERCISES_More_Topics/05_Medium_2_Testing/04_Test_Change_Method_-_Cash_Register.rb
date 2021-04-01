require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def test_change
    register = CashRegister.new(1000)
    transaction = Transaction.new(20)
    transaction.amount_paid = 50

    assert_equal 30, register.change(transaction)
  end
end
