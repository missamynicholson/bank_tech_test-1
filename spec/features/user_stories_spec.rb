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
    date_today_formatted = Date.new.strftime("%d/%m/%Y")
    transaction_printout = "#{date_today_formatted} ||  || 1000.00 || 0.00"
    expect(account.withdraw(1000)).to eq transaction_printout
  end

  # As a user
  # So that I have a record of each deposit
  # I want to store the date and amount of each deposit

  it "so I have a record of each deposit I want to store the date and amount" do
    account = Account.new
    date_today_formatted = Date.new.strftime("%d/%m/%Y")
    transaction_printout = "#{date_today_formatted} || 1000.00 ||  || 1000.00"
    expect(account.deposit(1000)).to eq transaction_printout
  end

end
