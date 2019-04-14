class Master < ApplicationRecord
  # has_many :offers, required: false
  belongs_to :category
  has_many :visits, dependent: :destroy
  has_many :working_hours, dependent: :destroy
  has_many :day_of_weeks, dependent: :destroy
  attr_accessor :new_category_name,:open,:close
  before_save :create_category_from_name
  enum day_of_week: [:Monday, :Tuesday, :Wednesday, :thursday, :friday, :saturday, :sunday]
  def current_time(params)
    params.strftime("%H:%M")
  end
  def create_category_from_name
    create_category(name: new_category_name) unless new_category_name.blank?
  end
end
