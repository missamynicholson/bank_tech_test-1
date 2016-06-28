require "account"

describe "User Stories" do

  # User Story 1
  # As a user
  # So that I can spend my money
  # I want to be able to withdraw money from my account

  it "so I can spend my money I want to withdraw money from my account" do
    account = Account.new
    expect { account.withdraw(500) }.not_to raise_error
  end

end
