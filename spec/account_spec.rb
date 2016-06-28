require "account"

describe Account do

  subject(:account) { described_class.new }

  it "can withdraw money" do
    expect(account).to respond_to(:withdraw).with(1).argument
  end

end
