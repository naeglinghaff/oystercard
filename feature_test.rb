require './lib/oystercard'

card = Oystercard.new
card.top_up(50)
card.deduct(5)

card.touch_in
card.touch_out
card.in_journey?
