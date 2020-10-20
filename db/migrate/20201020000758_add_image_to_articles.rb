class AddImageToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column:articales, :image, :string
  end
end
