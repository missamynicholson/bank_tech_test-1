require "statement"

describe Statement do

  subject(:statement) { described_class.new }

  let(:withdrawal_transaction) do
    double(:withdrawal_transaction, date: Date.new(2012,1,14), deposit: 0, withdrawal: 500, starting_balance: 3000)
  end

  let(:deposit_transaction2) do
    double(:deposit_transaction2, date: Date.new(2012,1,12), deposit: 2000, withdrawal: 0, starting_balance: 1000)
  end

  let(:deposit_transaction1) do
    double(:deposit_transaction1, date: Date.new(2012,1,10), deposit: 1000, withdrawal: 0, starting_balance: 0)
  end


  it "expect prints a transaction in correct format for withdrawal" do
    transaction_printout = "14/01/2012 ||  || 500.00 || 2500.00"
    expect(statement.printout(withdrawal_transaction)).to eq transaction_printout
  end

  it "expect prints a transaction in correct format for deposit" do
    transaction_printout = "12/01/2012 || 2000.00 ||  || 3000.00"
    expect(statement.printout(deposit_transaction2)).to eq transaction_printout
  end

  it "expect prints a summary of all transactions" do
    summary_printout = "14/01/2012 ||  || 500.00 || 2500.00\n" + "12/01/2012 || 2000.00 ||  || 3000.00\n" + "10/01/2012 || 1000.00 ||  || 1000.00\n"
    transactions = [deposit_transaction1, deposit_transaction2, withdrawal_transaction]
    expect(statement.printout_summary(transactions)).to eq summary_printout
  end

end
