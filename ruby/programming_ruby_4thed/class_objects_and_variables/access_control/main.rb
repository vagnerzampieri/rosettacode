require_relative 'account'
require_relative 'transaction'

p savings = Account.new(100)
p checking = Account.new(200)

p trans = Transaction.new(checking, savings)
p trans.transfer(50)

p savings.greater_balance_than?(checking)
p checking.greater_balance_than?(savings)
