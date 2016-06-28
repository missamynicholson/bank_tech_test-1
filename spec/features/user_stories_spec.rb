require "account"

describe "User Stories" do

  # As a user
  # So that I can spend my money
  # I want to be able to withdraw money from my account

  it "so I can spend my money I want to withdraw money from my account" do
    account = Account.new
    expect { account.withdraw(500) }.not_to raise_error
  end

  # As a user
  # So that I can keep my money safe
  # I want to be able to deposit money into my account

  it "so I can keep my money safe I want to deposit money into my account" do
    account = Account.new
    expect { account.deposit(1000) }.not_to raise_error
  end

  # As a user
  # So that I have a record of each withdrawal
  # I want to store the date and amount of each withdrawal

  it "so I have a record of each withdrawal I want to store the date and amount" do
    account = Account.new
    account.deposit(1000)
    account.deposit(2000)
    allow(Date).to receive(:today).and_return Date.new(2012,1,14)
    transaction_printout = "14/01/2012 ||  || 500.00 || 2500.00"
    expect(account.withdraw(500)).to eq transaction_printout
  end

  # As a user
  # So that I have a record of each deposit
  # I want to store the date and amount of each deposit

  it "so I have a record of each deposit I want to store the date and amount" do
    account = Account.new
    allow(Date).to receive(:today).and_return Date.new(2012,1,10)
    transaction_printout = "10/01/2012 || 1000.00 ||  || 1000.00"
    expect(account.deposit(1000)).to eq transaction_printout
  end

  # As a user
  # So that I can keep track of my money
  # I want to be able to print a statement of my account

  it " so I can keep track of my money I want to print a statement of my account" do
    account = Account.new
    allow(Date).to receive(:today).and_return Date.new(2012,1,10)
    account.deposit(1000)
    allow(Date).to receive(:today).and_return Date.new(2012,1,12)
    account.deposit(2000)
    allow(Date).to receive(:today).and_return Date.new(2012,1,14)
    account.withdraw(500)
    summary_printout = "14/01/2012 ||  || 500.00 || 2500.00\n" + "12/01/2012 || 2000.00 ||  || 3000.00\n" + "10/01/2012 || 1000.00 ||  || 1000.00\n"
    expect(account.summary).to eq summary_printout
  end

end
