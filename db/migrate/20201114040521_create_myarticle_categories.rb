class CreateMyarticleCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :myarticle_categories do |t|
      t.integer :myarticle_id
      t.integer :category_id
    end
  end
end
