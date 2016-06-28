require "account"

describe Account do

  TRANSACTION_AMOUNT = 100

  subject(:account) { described_class.new(statement: statement) }

  let(:statement) { double :statement }

  describe "#initialization" do
    it "has a balance of zero upon initialisation" do
      expect(account.balance).to eq Account::STARTING_BALANCE
    end

    it "has no transactions upon initialisation" do
      expect(account.transactions).to eq []
    end
  end

  describe "#withdraw" do
    before do
      allow(statement).to receive(:printout).and_return "printout"
    end

    it "can withdraw money" do
      expect(account).to respond_to(:withdraw).with(1).argument
    end

    it "decreases balance by amount withdrawn" do
      expect{ account.withdraw(TRANSACTION_AMOUNT) }.to change{ account.balance }.from(0).to(-TRANSACTION_AMOUNT)
    end

    it "adds a transaction into the transactions array" do
      expect{ account.withdraw(TRANSACTION_AMOUNT) }.to change{ account.transactions.count }.from(0).to(1)
    end

    it "adds the specific transaction into the transactions array" do
      allow(Transaction).to receive(:new).and_return :transaction_out
      account.withdraw(TRANSACTION_AMOUNT)
      expect(account.transactions).to include(:transaction_out)
    end

    it "returns a printout of the withdrawal" do
      transaction_printout = "14/01/2012 || || 1000.00 || 1000.00"
      allow(statement).to receive(:printout).and_return transaction_printout
      expect(account.withdraw(TRANSACTION_AMOUNT)).to eq transaction_printout
    end

  end

  describe "#deposit" do
    before do
      allow(statement).to receive(:printout).and_return "printout"
    end

    it "can deposit money" do
      expect(account).to respond_to(:deposit).with(1).argument
    end

    it "increases balance by amount deposited" do
      expect{ account.deposit(TRANSACTION_AMOUNT) }.to change{ account.balance }.from(0).to(TRANSACTION_AMOUNT)
    end

    it "adds a transaction into the transactions array" do
      expect{ account.deposit(TRANSACTION_AMOUNT) }.to change{ account.transactions.count }.from(0).to(1)
    end

    it "adds the specific transaction into the transactions array" do
      allow(Transaction).to receive(:new).and_return :transaction_in
      account.deposit(TRANSACTION_AMOUNT)
      expect(account.transactions).to include(:transaction_in)
    end

    it "returns a printout of the deposit" do
      transaction_printout = "14/01/2012 || 1000.00 ||  || 1000.00"
      allow(statement).to receive(:printout).and_return transaction_printout
      expect(account.withdraw(TRANSACTION_AMOUNT)).to eq transaction_printout
    end
  end

end
