class AddIsAdminToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :isAdmin, :integer, :default => 0
  end
end
