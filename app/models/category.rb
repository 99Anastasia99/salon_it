class Category < ApplicationRecord
  has_many :masters, dependent: destroy
  has_many :offers, depenent: destroy
end
