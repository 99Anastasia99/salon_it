class AddDuration < ActiveRecord::Migration[5.2]
  def change
    add_column :masters, :open_time, :time
    add_column :masters, :close_time, :time
    add_column :offers, :duration, :time
    add_column :clients, :latest_date_of_visit, :date
  end
end
