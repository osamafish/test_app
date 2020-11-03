class AddUserIdToArticles < ActiveRecord::Migration[6.0]
  def change
      add_column :myarticles, :user_id, :int
  end
end
