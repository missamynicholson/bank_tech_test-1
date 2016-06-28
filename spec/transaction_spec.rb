require 'transaction'

describe Transaction do
  TRANSACTION_AMOUNT = 100

  subject(:transaction) do
    described_class.new(date: Date.new, deposit: TRANSACTION_AMOUNT, withdrawal: 0, starting_balance: 1000)
  end

  describe '#date' do
    it 'returns date of transaction' do
      expect(transaction.date).to eq Date.new
    end
  end

  describe '#deposit' do
    it 'returns deposit amount of transaction' do
      expect(transaction.deposit).to eq TRANSACTION_AMOUNT
    end
  end

  describe '#withdrawal' do
    it 'returns withdrawal amount of transaction' do
      expect(transaction.withdrawal).to eq 0
    end
  end

  describe '#starting balance' do
    it 'returns starting balance of transaction' do
      expect(transaction.starting_balance).to eq 1000
    end
  end
end
