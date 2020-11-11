class AddUserIdToMyarticles < ActiveRecord::Migration[6.0]
  def change
    add_column :myarticles, :myuser_id, :int
  end
end
