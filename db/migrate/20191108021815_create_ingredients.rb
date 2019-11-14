class CreateIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :image_name
      t.string :gif_name

      t.timestamps
    end
  end
end
