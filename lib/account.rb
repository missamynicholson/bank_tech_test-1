class Account

  STARTING_BALANCE = 0

  attr_reader :balance

  def initialize
    @balance = STARTING_BALANCE
  end

  def withdraw(amount)
    @balance -= amount
  end

  def deposit(amount)
    @balance += amount
  end

end
