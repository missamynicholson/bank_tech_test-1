require "statement"

describe Statement do
  WITHDRAWAL_AMOUNT = 500

  subject(:statement) { described_class.new }

  let(:withdrawal_transaction) do
    double(:withdrawal_transaction, date: Date.new(2012,1,14), deposit: 0, withdrawal: WITHDRAWAL_AMOUNT, starting_balance: 3000)
  end


  it "expect prints a transaction in correct format" do
    transaction_printout = "14/01/2012 ||  || 500.00 || 2500.00"
    expect(statement.printout(withdrawal_transaction)).to eq transaction_printout
  end

  it "formats the date" do
    expect(statement.format_date(Date.new(2012,1,14))).to eq "14/01/2012"
  end

  it "formats the transaction amount" do
    expect(statement.format_amount(500)).to eq "500.00"
  end

  it "formats the withdrawal amount if zero" do
    expect(statement.format_amount(0)).to eq ""
  end

  it "calculates balance for deposit" do
    expect(statement.calculate_balance(1000, 2000, 0)).to eq 3000
  end

  it "calculates balance for withdrawal" do
    expect(statement.calculate_balance(3000, 0, 500)).to eq 2500
  end

  it "formats balance if zero" do
    expect(statement.format_balance(0)).to eq "0.00"
  end
end
