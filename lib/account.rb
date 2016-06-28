class Account

  STARTING_BALANCE = 0

  attr_reader :balance, :transactions, :statement

  def initialize(statement: Statement.new)
    @balance = STARTING_BALANCE
    @transactions = []
    @statement = statement
  end

  def withdraw(amount)
    transaction = Transaction.new(date: Date.new, deposit: 0, withdrawal: amount, starting_balance: balance)
    @transactions << transaction
    @balance -= amount
    statement.printout(transaction)
  end

  def deposit(amount)
    transaction = Transaction.new(date: Date.new, deposit: amount, withdrawal: 0, starting_balance: balance)
    @transactions << transaction
    @balance += amount
    statement.printout(transaction)
  end

end
