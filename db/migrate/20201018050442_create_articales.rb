class CreateArticales < ActiveRecord::Migration[6.0]
  def change
    create_table :articales do |t|
      t.string :title
      #t.string :string
      t.string :link
      
      t.text :description

      t.timestamps
    end
  end
end
