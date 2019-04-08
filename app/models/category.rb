class Category < ApplicationRecord
  has_many :offers, dependent: :destroy
  has_many :masters, dependent: :destroy
  validates :name,length: {maximum: 20},presence: true, uniqueness: { scope: :name, message: "must be unique " }
end
