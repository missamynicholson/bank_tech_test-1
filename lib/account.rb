class Account

  STARTING_BALANCE = 0

  attr_reader :balance, :transactions

  def initialize
    @balance = STARTING_BALANCE
    @transactions = []
  end

  def withdraw(amount)
    @transactions << Transaction.new(date: Date.new, amount: amount, type: "withdraw")
    @balance -= amount
  end

  def deposit(amount)
    @transactions << Transaction.new(date: Date.new, amount: amount, type: "deposit")
    @balance += amount
  end

end
