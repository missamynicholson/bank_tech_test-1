require "account"

describe Account do

  TRANSACTION_AMOUNT = 100

  subject(:account) { described_class.new }

  describe "#initialization" do
    it "has a balance of zero upon initialisation" do
      expect(account.balance).to eq Account::STARTING_BALANCE
    end
  end

  describe "#withdraw" do
    it "can withdraw money" do
      expect(account).to respond_to(:withdraw).with(1).argument
    end

    it "decreases balance by amount withdrawn" do
      expect{ account.withdraw(TRANSACTION_AMOUNT) }.to change{ account.balance }.from(0).to(-TRANSACTION_AMOUNT)
    end
  end

  describe "#deposit" do
    it "can deposit money" do
      expect(account).to respond_to(:deposit).with(1).argument
    end

    it "increases balance by amount deposited" do
      expect{ account.deposit(TRANSACTION_AMOUNT) }.to change{ account.balance }.from(0).to(TRANSACTION_AMOUNT)
    end
  end

end
