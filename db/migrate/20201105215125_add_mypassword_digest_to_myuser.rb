class AddMypasswordDigestToMyuser < ActiveRecord::Migration[6.0]
  def change
    add_column :myusers, :mypassword_digest, :string
  end
end
