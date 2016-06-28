require "statement"

describe Statement do
  TRANSACTION_AMOUNT = 100

  subject(:statement) { described_class.new() }

  let(:withdrawal_transaction) do
    double(:withdrawal_transaction, date: Date.new, deposit: 0, withdrawal: TRANSACTION_AMOUNT, starting_balance: 100)
  end


  it "expect prints a transaction in correct format" do
    date_today_formatted = Date.new.strftime("%d/%m/%Y")
    transaction_printout = "#{date_today_formatted} ||  || 100.00 || 0.00"
    expect(statement.printout(withdrawal_transaction)).to eq transaction_printout
  end

  it "formats the date" do
    date_today_formatted = Date.new.strftime("%d/%m/%Y")
    expect(statement.format_date(Date.new)).to eq date_today_formatted
  end

  it "formats the transaction amount" do
    expect(statement.format_amount(100)).to eq "100.00"
  end

  it "formats the withdrawal amount if zero" do
    expect(statement.format_amount(0)).to eq ""
  end

  it "calculates balance for deposit" do
    expect(statement.calculate_balance(100, 100, 0)).to eq 200
  end

  it "calculates balance for withdrawal" do
    expect(statement.calculate_balance(100, 0, 100)).to eq 0
  end

  it "formats balance if zero" do
    expect(statement.format_balance(0)).to eq "0.00"
  end
end
