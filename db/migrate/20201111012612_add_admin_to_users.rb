class AddAdminToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :myusers, :admin, :boolean, default: false
  end
end
