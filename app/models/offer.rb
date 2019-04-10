class Offer < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :master, optional: true
  belongs_to :client,optional: true
  belongs_to :visit,optional: true
  before_save :create_category_from_name
  attr_accessor :new_category_name

  def create_category_from_name
    create_category(name: new_category_name) unless new_category_name.blank?
  end
end
