class Oystercard

  attr_reader :balance
  LIMIT = 90

  def initialize
    @balance = 0
  end

  def top_up(value)
    fail "Top up limit of #{LIMIT} exceeded" if value > LIMIT
    @balance += value
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    true
  end

  # Test branch

end
