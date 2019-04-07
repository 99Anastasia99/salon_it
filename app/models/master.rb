class Master < ApplicationRecord
  # has_many :working_hours, dependent: destroy, required: false
  # has_many :offers, required: false
  belongs_to :category
  attr_accessor :new_category_name
  before_save :create_category_from_name

  def create_category_from_name
    create_category(name: new_category_name) unless new_category_name.blank?
  end
end
