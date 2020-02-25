require "oystercard"

describe Oystercard do
  before(:each) do
    @card = Oystercard.new
  end

  it 'card has balance' do
    expect(@card.balance).to eq (0.00)
  end


  describe '#top_up' do
    it  'changes the balance variable' do
      expect { @card.top_up(50.00) }.to change(@card, :balance).by(50.00)
    end

    it 'updates balance to a specific value' do
      @card.top_up(80.00)
      expect(@card.balance).to eq (80.00)
    end

    it 'raises an error when topping up more than 90' do
      expect{ @card.top_up(95.00) }.to raise_error(@card.limit_error)
    end
  end

  describe '#deduct' do
    it {is_expected.to respond_to(:deduct).with(1).argument }
    it  'changes the balance variable' do
      expect { @card.deduct(5.00) }.to change(@card, :balance).by(-5.00)
    end
  end

  describe '#touch_in' do
    it {is_expected.to respond_to(:touch_in) }
    it 'returns true when user is on a journey' do
      expect(@card.touch_in).to eq true
    end
  end

  describe '#touch_out' do
    it {is_expected.to respond_to(:touch_out) }
    it 'returns false when journey is ended' do
      expect(@card.touch_out).to eq false
    end
  end

  describe '#in_journey?' do
    it {is_expected.to respond_to(:in_journey?) }
    it 'is not initially on a journey' do
      expect(subject).not_to be_in_journey
    end
    it 'returns true when user is touched in' do
      @card.touch_in
      expect(@card.in_journey?).to eq true
    end
    it 'returns false when user is touched out' do
      @card.touch_in
      @card.touch_out
      expect(@card.in_journey?).to eq false
    end
  end
end
