class Category < ApplicationRecord
  # has_many :offers, depenent: destroy
  has_many :categorizations
  has_many :masters, :through => :categorizations
end
