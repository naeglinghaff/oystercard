class Oystercard

  attr_reader :balance
  MAX_BALANCE = 90
  MIN_FARE = 1

  def initialize
    @balance = 0
    @travelling = false
  end

  def top_up(value)
    fail "Top up limit of #{MAX_BALANCE} exceeded" if value > MAX_BALANCE
    @balance += value
  end

  def touch_in
    fail "Not enough money in your card" if @balance < MIN_FARE
    @travelling = true
  end

  def touch_out
    fail "Currently not travelling" if @travelling == false
    @balance = deduct(MIN_FARE)
    @travelling = false
  end

  def in_journey?
    @travelling
  end

  private

  def deduct(amount)
    fail "Not enough money in your card" if amount > @balance
    @balance -= amount
  end

end
