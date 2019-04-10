class AddAdressAndOther < ActiveRecord::Migration[5.2]
  def change
    add_column :visits, :price,:float, default: 0.0
    add_column :masters, :surname, :string
    add_column :masters, :patronymmic, :string
    remove_column :visits, :total_price
    add_reference :visits, :master
  end
end
