require "oystercard"

describe Oystercard do
  before(:each) do
    @card = Oystercard.new
  end

describe '#view_balance' do
  it 'card has balance' do
    expect(@card.balance).to eq (0.00)
  end
  end
end
