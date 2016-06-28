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

end
