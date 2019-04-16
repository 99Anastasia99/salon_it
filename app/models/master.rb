class Master < ApplicationRecord
  validates :name,:surname,:patronymmic,length: {maximum: 20}, presence: true
  validates :open_time,:close_time,presence: false, if: :earlier?
  belongs_to :category
  has_many :offers, dependent: :destroy
  has_many :visits, dependent: :destroy
  has_many :working_hours, dependent: :destroy
  has_many :day_of_weeks, dependent: :destroy
  attr_accessor :new_category_name
  before_save :create_category_from_name
  def earlier?
    self.close_time > self.open_time
  end
  def current_time(params)
    params.strftime("%H:%M") unless params.blank?
  end
  def create_category_from_name
    create_category(name: new_category_name) unless new_category_name.blank?
  end
end
