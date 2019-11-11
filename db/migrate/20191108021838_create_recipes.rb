class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :image_url
      t.integer :damage

      t.timestamps
    end
  end
end
