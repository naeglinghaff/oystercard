require './lib/oystercard'

card = Oystercard.new
card.top_up(4)
card.deduct(2)

card.touch_in
card.touch_out
card.in_journey?

card.deduct(2)
card.touch_in
# This should raise an error since balance = 0
