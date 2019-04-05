class Offer < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :master, optional: true
end
