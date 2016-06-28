class Transaction

  attr_reader :date, :deposit, :withdrawal, :starting_balance

  def initialize(date:, deposit:, withdrawal:, starting_balance:)
    @date = date
    @deposit = deposit
    @withdrawal = withdrawal
    @starting_balance = starting_balance
  end
end
