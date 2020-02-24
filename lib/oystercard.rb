class Oystercard

  attr_reader :balance

  def initialize
    @balance = 0.00
  end

  def top_up(money)
    @balance += money
  end

end
