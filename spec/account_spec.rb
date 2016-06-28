require "account"

describe Account do

  TRANSACTION_AMOUNT = 100

  subject(:account) { described_class.new }

  describe "#initialization" do
    it "has a balance of zero upon initialisation" do
      expect(account.balance).to eq Account::STARTING_BALANCE
    end

    it "has no transactions upon initialisation" do
      expect(account.transactions).to eq []
    end
  end

  describe "#withdraw" do
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

    it "returns the current balance" do
      expect(account.withdraw(TRANSACTION_AMOUNT)).to eq(Account::STARTING_BALANCE - TRANSACTION_AMOUNT)
    end

  end

  describe "#deposit" do
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

    it "returns the current balance" do
      expect(account.deposit(TRANSACTION_AMOUNT)).to eq(Account::STARTING_BALANCE + TRANSACTION_AMOUNT)
    end
  end

end
