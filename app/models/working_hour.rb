class WorkingHour < ApplicationRecord
  belongs_to :master
  belongs_to :day_of_week
  def day_of_week=(value)
    day = Date::DAY_NAMES.index(value)
    write_attribute(:day_of_week, day) if day.present?
  end
end
