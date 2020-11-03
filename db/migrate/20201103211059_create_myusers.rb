class CreateMyusers < ActiveRecord::Migration[6.0]
  def change
    create_table :myusers do |t|
      t.string :username
      t.string :password
      t.string :email
      
      t.timestamps

    end
  end
end
