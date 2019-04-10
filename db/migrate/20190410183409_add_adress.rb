class AddAdress < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :city, :string
    add_column :clients, :street, :string
    add_column :clients, :region, :string
    add_column :clients, :country, :string
    add_column :clients, :building, :string
    add_column :clients, :flat, :integer
  end
end
