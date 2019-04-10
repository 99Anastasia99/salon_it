class CreateVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :visits do |t|
      t.references :client, foreign_key: true
      t.references :offer, foreign_key: true
      t.string :offers_list
      t.float :total_price
      t.date :date_of_visit
      t.timestamps
    end
  end
end
