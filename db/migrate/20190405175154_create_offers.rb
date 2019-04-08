class CreateOffers < ActiveRecord::Migration[5.2]
  def change
create_table :offers do |t|
  t.float :price
  t.time  :duration
  t.string :name
  t.string :description
  t.references :master, foreign_key: true
  t.references :category, foreign_key: true
    end
    add_reference :masters, :category
  end
end
