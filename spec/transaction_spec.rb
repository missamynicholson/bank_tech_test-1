require 'transaction'

describe Transaction do
  TRANSACTION_AMOUNT = 100

  subject(:transaction) do
    described_class.new(date: 2016-06-28, amount: TRANSACTION_AMOUNT, type: "deposit")
  end

  describe '#date' do
    it 'returns date of transaction' do
      expect(transaction.date).to eq 2016-06-28
    end
  end

  describe '#amount' do
    it 'returns amount of transaction' do
      expect(transaction.amount).to eq TRANSACTION_AMOUNT
    end
  end

  describe '#type' do
    it 'returns type of transaction' do
      expect(transaction.type).to eq "deposit"
    end
  end
end
