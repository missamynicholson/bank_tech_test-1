class Transaction

  attr_reader :date, :amount, :type

  def initialize(date:, amount:, type:)
    @date = date
    @amount = amount
    @type = type
  end
end
