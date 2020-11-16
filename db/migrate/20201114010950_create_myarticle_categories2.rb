class CreateMyarticleCategories2 < ActiveRecord::Migration[6.0]
  def change
      add_column :myarticle_categories, :myarticle_id, :string
  end
end