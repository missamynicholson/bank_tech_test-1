class Statement

  def printout(transaction)
    starting_balance = transaction.starting_balance
    deposit = transaction.deposit
    withdrawal = transaction.withdrawal

    "#{format_date(transaction.date)} ||" +
    " #{format_amount(deposit)} ||" +
    " #{format_amount(withdrawal)} ||" +
    " #{format_balance(calculate_balance(starting_balance, deposit, withdrawal))}"
  end

  def format_amount(amount)
    amount == 0 ? "" : sprintf('%.2f', amount)
  end

  def format_date(date)
    date.strftime("%d/%m/%Y")
  end

  def calculate_balance(starting_balance, deposit, withdrawal)
    starting_balance + deposit - withdrawal
  end

  def format_balance(amount)
    sprintf('%.2f', amount)
  end

end
