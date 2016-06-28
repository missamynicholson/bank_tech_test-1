require 'transaction'

describe Transaction do
  DEPOSIT_AMOUNT = 2000
  STARTING_BALANCE = 1000

  subject(:transaction) do
    described_class.new(date: Date.new(2012,1,10), deposit: DEPOSIT_AMOUNT,
                        withdrawal: 0, starting_balance: STARTING_BALANCE)
  end

  describe '#date' do
    it 'returns date of transaction' do
      expect(transaction.date).to eq Date.new(2012,1,10)
    end
  end

  describe '#deposit' do
    it 'returns deposit amount of transaction' do
      expect(transaction.deposit).to eq DEPOSIT_AMOUNT
    end
  end

  describe '#withdrawal' do
    it 'returns withdrawal amount of transaction' do
      expect(transaction.withdrawal).to eq 0
    end
  end

  describe '#starting balance' do
    it 'returns starting balance of transaction' do
      expect(transaction.starting_balance).to eq STARTING_BALANCE
    end
  end
end
