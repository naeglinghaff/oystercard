class Oystercard

  attr_reader :balance
  LIMIT = 90

  def initialize
    @balance = 0
    @travelling = false
  end

  def top_up(value)
    fail "Top up limit of #{LIMIT} exceeded" if value > LIMIT
    @balance += value
  end

  def deduct(amount)
    fail "Not enough money in your card" if amount > @balance
    @balance -= amount
  end

  def touch_in
    @travelling = true
  end

  def touch_out
    fail "Currently not travelling" if @travelling == false
    @travelling = false
  end

  def in_journey?
    @travelling
  end

end
