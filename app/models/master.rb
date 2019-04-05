class Master < ApplicationRecord
  has_many :working_hours, dependent: destroy
  has_many :offers
  belongs_to :category, optional: true
end
