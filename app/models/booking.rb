class Booking < ApplicationRecord
  attr_accessor :date_range
  def end_offer_time
    offer_id = self.offer_id
    @offer = Offer.find(offer_id)
    duration = @offer.duration.strftime("%H").to_i*60 + @offer.duration.strftime("%H").to_i
    end_time = self.start_time + duration.minutes
    self.update(end_time: end_time)
  end
end
