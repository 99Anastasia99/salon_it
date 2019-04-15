class Visit < ApplicationRecord
  belongs_to :client
  belongs_to :master
  has_many :offers
  def total_price
      @offer =  Offer.find(self.offers_list)
      price = @offer.price
      self.update(price: price)
      return price
    end
end
