class Oystercard

  attr_reader :balance, :entry_station
  MAX_BALANCE = 90
  MIN_FARE = 1

  def initialize
    @balance = 0
    @entry_station = nil
  end

  def top_up(value)
    fail "Top up limit of #{MAX_BALANCE} exceeded" if value > MAX_BALANCE
    @balance += value
  end

  def touch_in(station_name)
    fail "Not enough money in your card" if @balance < MIN_FARE
    @entry_station = station_name
  end

  def touch_out
    fail "Currently not travelling" if @entry_station == nil
    @balance = deduct(MIN_FARE)
    @entry_station = nil
  end

  def in_journey?
    !!@entry_station  # converts @entry_station in a boolean (will return true for any value thats not nil/false)
    # if @entry_station != nil
    #   return true
    # else false
    # end
  end

  private

  def deduct(amount)
    fail "Not enough money in your card" if amount > @balance
    @balance -= amount
  end

end
