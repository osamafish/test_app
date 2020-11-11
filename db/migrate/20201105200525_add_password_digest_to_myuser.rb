class AddPasswordDigestToMyuser < ActiveRecord::Migration[6.0]
  def change
    add_column :myusers, :password_digest, :string
  end
end