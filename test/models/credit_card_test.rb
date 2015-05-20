require "test_helper"

describe CreditCard do
  let(:credit_card) { CreditCard.new }

  it "must be valid" do
    credit_card.must_be :valid?
  end
end
