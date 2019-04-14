class DaysOfWeek < ActiveRecord::Migration[5.2]
  def change
    create_table :day_of_weeks do |t|
      t.string :name_of_day
      t.belongs_to :master
  end
  add_reference :working_hours,:day_of_week
  remove_column :masters,:day_of_week
end
end
