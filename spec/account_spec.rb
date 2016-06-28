require "account"

describe Account do

  TRANSACTION_AMOUNT = 1000

  subject(:account) { described_class.new(statement: statement) }

  let(:statement) { double :statement }

  before do
    allow(statement).to receive(:printout).and_return "printout"
  end

  describe "#initialization" do
    it "has no transactions upon initialisation" do
      expect(account.transactions).to eq []
    end
  end

  describe "#withdraw" do
    it "adds the specific transaction into the transactions array" do
      allow(Transaction).to receive(:new).and_return :transaction_out
      account.withdraw(TRANSACTION_AMOUNT)
      expect(account.transactions).to include(:transaction_out)
    end

    it "returns a printout of the withdrawal" do
      allow(statement).to receive(:printout).and_return :transaction_printout
      expect(account.withdraw(TRANSACTION_AMOUNT)).to eq :transaction_printout
    end

  end

  describe "#deposit" do
    it "adds the specific transaction into the transactions array" do
      allow(Transaction).to receive(:new).and_return :transaction_in
      account.deposit(TRANSACTION_AMOUNT)
      expect(account.transactions).to include(:transaction_in)
    end

    it "returns a printout of the deposit" do
      allow(statement).to receive(:printout).and_return :transaction_printout
      expect(account.withdraw(TRANSACTION_AMOUNT)).to eq :transaction_printout
    end
  end

end
