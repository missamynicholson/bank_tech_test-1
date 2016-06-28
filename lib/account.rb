class Account

  attr_reader :transactions, :statement

  def initialize(statement: Statement.new)
    @transactions = []
    @statement = statement
  end

  def withdraw(amount)
    transaction = create_transaction(0, amount)
    @transactions << transaction
    statement.printout(transaction)
  end

  def deposit(amount)
    transaction = create_transaction(amount, 0)
    @transactions << transaction
    statement.printout(transaction)
  end

  private

  def create_transaction(deposit_amount, withdrawal_amount)
    Transaction.new(date: Date.today, deposit: deposit_amount, withdrawal: withdrawal_amount, starting_balance: get_balance)
  end


  def get_balance
    transactions.count > 0 ? get_ending_balance : 0
  end

  def get_ending_balance
    last_trans = transactions.last
    last_trans.starting_balance + last_trans.deposit - last_trans.withdrawal
  end

end
