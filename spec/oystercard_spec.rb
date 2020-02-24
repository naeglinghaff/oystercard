require "oystercard"

describe Oystercard do
  before(:each) do
    @card = Oystercard.new
  end

  it 'card has balance' do
    expect(@card.balance).to eq (0.00)
  end

  it { is_expected.to respond_to(:top_up).with(1).argument }

  it 'updates balance' do
    @card.top_up(100.00)
    expect(@card.balance).to eq (100.00)
  end

end
