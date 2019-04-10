class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
    t.float :average_spending, default: 0.0
    t.integer :average_visits, default: 0
    t.string :name
    t.string :patronymic
    t.string :surname
    t.datetime :date_of_birth
      t.timestamps
    end
  end
end
