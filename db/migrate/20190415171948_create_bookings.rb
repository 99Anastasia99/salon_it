class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.belongs_to :master
      t.belongs_to :client
      t.belongs_to :offer
      t.time :start_time
      t.time :end_time
      t.integer :duration
      t.string :color
    end
  end
end
