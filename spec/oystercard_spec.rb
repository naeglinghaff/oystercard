require 'oystercard'

describe Oystercard do

  it "initializes with default balance of 0" do
    expect(subject.balance).to eq 0
  end

  it "initializes with #in_journey? false" do
    expect(subject.in_journey?).to eq false
  end

  it 'initializes with an empty journey_history' do
    expect(subject.journey_history).to eq []
  end

  describe "#top_up" do
    it "adds #top_up value to balance" do
      expect { subject.top_up 10 }.to change{ subject.balance }.by 10
      # subject.top_up(10)
      # expect(subject.balance).to eq 10
    end

    it "raises an error when #top_up value exceeds limit" do
      expect{ subject.top_up(95) }.to raise_error("Top up limit of #{Oystercard::MAX_BALANCE} exceeded")
    end

  end

  describe "#deduct" do
    it "#deducts value from balance" do
      subject.top_up(10)
      expect { subject.send(:deduct,5) }.to change{ subject.balance }.by -5 # calling the private method
    end

    it "raises an error when #deduct and balance is too low" do
      # @balance = 10
      subject.top_up(10)
      expect { subject.send(:deduct,15) }.to raise_error("Not enough money in your card")
    end
  end

  describe "#touch_in" do
    it "#in_journey? returns true if #touch_in" do
      subject.instance_variable_set(:@balance, 10) # Sets an instance variable to chosen value
      subject.touch_in("entry_station")
      expect(subject.in_journey?).to be true
    end

    it "raises an error if #touch_in and balance is below MIN_FARE" do
      expect{ subject.touch_in("entry_station") }.to raise_error("Not enough money in your card")
    end
  end

  describe "#touch_out" do

    it "#touch_out raises error if #in_journey? is false" do
      expect{subject.touch_out("exit_station")}.to raise_error("Currently not travelling")
    end

    it "#in_journey? returns false after #touch_out" do
      subject.instance_variable_set(:@balance, 10)
      subject.touch_in("entry_station")
      subject.touch_out("exit_station")
      expect(subject.in_journey?).to be false
    end

    it 'deducts minimum fare when you #touch_out' do
      subject.instance_variable_set(:@balance, 10)
      subject.touch_in("entry_station")
      expect { subject.touch_out("exit_station") }.to change { subject.balance }.by -Oystercard::MIN_FARE
    end
  end

  describe "journey_history" do
    it "saves the entry_station at #touch_in" do
      # card = double()
      # allow(card).to receive(:touch_in).with("station_name")
      subject.instance_variable_set(:@balance, 10)
      subject.touch_in("entry_station")
      expect(subject.entry_station).to eq "entry_station"
    end

    it "resets the entry_station to nil at #touch_out" do
      subject.instance_variable_set(:@balance, 10)
      subject.touch_in("entry_station")
      subject.touch_out("exit_station")
      expect(subject.entry_station).to eq nil
    end

    it 'save an exit station at #touch_out' do
      subject.instance_variable_set(:@balance, 10)
      subject.touch_in("entry_station")
      subject.touch_out("exit_station")
      expect(subject.exit_station).to eq("exit_station")
    end

    context 'saves exit and entry stations' do
      it 'stores entry and exit in an instance variable' do
        subject.instance_variable_set(:@balance, 10)
        subject.touch_in("entry_station")
        subject.touch_out("exit_station")
        expect(subject.journey_history).to eq([{:entry_station => "entry_station",:exit_station => "exit_station"}])
      end
    end
  end



end
