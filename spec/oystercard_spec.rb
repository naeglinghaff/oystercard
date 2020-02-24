require "oystercard"

describe Oystercard do
  before(:each) do
    @card = Oystercard.new
  end

  it 'has money' do
    expect(@card.view_balance).to be (@card.balance)
  end
end
