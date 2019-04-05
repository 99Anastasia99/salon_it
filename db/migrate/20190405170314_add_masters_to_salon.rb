class AddMastersToSalon < ActiveRecord::Migration[5.2]
  def change
    create_table :masters do |t|
    t.string :name
    end
  end
end
