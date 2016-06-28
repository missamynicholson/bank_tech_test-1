require "account"

describe Account do

  TRANSACTION_AMOUNT = 1000

  subject(:account) { described_class.new(statement: statement) }

  let(:statement) { double :statement }

  describe "#initialization" do
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

    it "adds a transaction into the transactions array" do
      expect{ account.withdraw(TRANSACTION_AMOUNT) }.to change{ account.transactions.count }.from(0).to(1)
    end

    it "adds the specific transaction into the transactions array" do
      allow(Transaction).to receive(:new).and_return :transaction_out
      account.withdraw(TRANSACTION_AMOUNT)
      expect(account.transactions).to include(:transaction_out)
    end

    it "returns a printout of the withdrawal" do
      transaction_printout = "14/01/2012 || || 500.00 || 2500.00"
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

    it "adds a transaction into the transactions array" do
      expect{ account.deposit(TRANSACTION_AMOUNT) }.to change{ account.transactions.count }.from(0).to(1)
    end

    it "adds the specific transaction into the transactions array" do
      allow(Transaction).to receive(:new).and_return :transaction_in
      account.deposit(TRANSACTION_AMOUNT)
      expect(account.transactions).to include(:transaction_in)
    end

    it "returns a printout of the deposit" do
      transaction_printout = "10/01/2012 || 1000.00 ||  || 1000.00"
      allow(statement).to receive(:printout).and_return transaction_printout
      expect(account.withdraw(TRANSACTION_AMOUNT)).to eq transaction_printout
    end
  end

  describe "#get_balance" do
    context "where there are previous transactions" do
      let(:transaction_in) do
        double(:transaction_in, date: nil, deposit: TRANSACTION_AMOUNT,
                            withdrawal: 0, starting_balance: 0)
      end
      it "returns the current balance" do
        allow(account).to receive(:transactions).and_return [transaction_in]
        expect(account.get_balance).to eq 1000
      end
    end

    context "where there are no previous transactions" do
      it "returns zero" do
        expect(account.get_balance).to eq 0
      end
    end
  end

end
