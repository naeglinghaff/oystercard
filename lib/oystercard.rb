class Oystercard

  MAXIMUM_LIMIT = 90.00
  @limit_error = "The limit is #{MAXIMUM_LIMIT}"

  attr_reader :balance

  def initialize
    @balance = 0.00
  end

  def top_up(money)
    fail @limit_error if @balance + money > MAXIMUM_LIMIT
    @balance += money
  end

end
