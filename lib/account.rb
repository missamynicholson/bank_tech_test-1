class Account

  attr_reader :transactions, :statement

  def initialize(statement: Statement.new)
    @transactions = []
    @statement = statement
  end

  def withdraw(amount)
    transaction = Transaction.new(date: Date.today, deposit: 0, withdrawal: amount, starting_balance: get_balance)
    @transactions << transaction
    statement.printout(transaction)
  end

  def deposit(amount)
    transaction = Transaction.new(date: Date.today, deposit: amount, withdrawal: 0, starting_balance: get_balance)
    @transactions << transaction
    statement.printout(transaction)
  end

  def get_balance
    transactions.count > 0 ? get_ending_balance : 0
  end

  def get_ending_balance
    last_trans = transactions.last
    last_trans.starting_balance + last_trans.deposit - last_trans.withdrawal
  end

end
