require "oystercard"

describe Oystercard do

  it "initializes with default balance of 0" do
    expect(subject.balance).to eq 0
  end

  describe "#top_up" do

    it "adds #top_up value to balance" do
      expect { subject.top_up 10 }.to change{ subject.balance }.by 10

      # subject.top_up(10)
      # expect(subject.balance).to eq 10
    end

    it "raises an error when #top_up value exceeds limit" do
      expect{ subject.top_up(95) }.to raise_error("Top up limit of #{Oystercard::LIMIT} exceeded")
    end
  end

  describe "#deduct" do

    it "#deducts value from balance" do
      subject.top_up(10)
      expect { subject.deduct(5) }.to change{ subject.balance }.by -5
    end

    it "raises an error when #deduct and balance is too low" do
      # @balance = 10
      subject.top_up(10)
      expect { subject.deduct(15) }.to raise_error("Not enough money in your card")
    end
  end

  describe "#touch_in" do

    it "checks if card has been used to #touch_in" do
      expect(subject.touch_in).to eq true
    end
  end
end
