class AddDatetimeToMyarticles < ActiveRecord::Migration[6.0]
  def change
    add_column :myarticles, :created_at, :datetime
    add_column :myarticles, :updated_at, :datetime
  end
end
