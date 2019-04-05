class RemoveRolesAdddAdminToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :admin, :boolean, default: false
    remove_column :users, :role, :string, default: 'manager'
  end
end
