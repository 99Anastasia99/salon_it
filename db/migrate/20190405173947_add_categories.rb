class AddCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.belongs_to :masters, index: true
    end
    create_table :working_hours do |t|
    t.belongs_to :masters, index: true
    t.integer :day_of_week
    t.time :open
    t.time :close
   end
  end
end
