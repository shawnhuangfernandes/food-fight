class CreateChefs < ActiveRecord::Migration[6.0]
  def change
    create_table :chefs do |t|
      t.string :name
      t.integer :lives
      t.string :image_name

      t.timestamps
    end
  end
end
