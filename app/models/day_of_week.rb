class DayOfWeek < ApplicationRecord
  belongs_to :master
  has_many :working_hours
end
