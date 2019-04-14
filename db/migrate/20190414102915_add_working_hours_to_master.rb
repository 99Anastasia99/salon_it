class AddWorkingHoursToMaster < ActiveRecord::Migration[5.2]
  def change
    add_column :masters, :day_of_week, :integer
    end
end
