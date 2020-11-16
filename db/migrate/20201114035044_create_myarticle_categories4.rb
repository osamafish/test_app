class CreateMyarticleCategories4 < ActiveRecord::Migration[6.0]
  def change
    create_table :myarticle_categories4s do |t|
      t.integer :myarticle_id
      t.integer :category_id
    end
  end
end
