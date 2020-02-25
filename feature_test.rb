require './lib/oystercard'

card = Oystercard.new
card.top_up(1)
# balance will be one
card.touch_in
# balance will be 0
card.touch_out
card.in_journey?

card.touch_in
#will throw error cos we poor
