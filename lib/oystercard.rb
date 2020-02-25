class Oystercard

  MAXIMUM_LIMIT = 90.00
  MINIMUM_BALANCE = 1.00
  attr_reader :balance, :limit_error

  def initialize
    @balance = 0.00
    @limit_error = "The limit is #{MAXIMUM_LIMIT}"
    @in_journey = false
  end

  def top_up(money)
    fail @limit_error if @balance + money > MAXIMUM_LIMIT
    @balance += money
  end

   def touch_in
     raise "Insufficient funds. Top up your card :-)" if @balance < MINIMUM_BALANCE
     @in_journey = true
   end

   def touch_out
     @balance = deduct(MINIMUM_BALANCE)
     @in_journey = false
   end

  def in_journey?
    @in_journey
   end

   private

   def deduct(money)
     @balance -= money
   end
end
