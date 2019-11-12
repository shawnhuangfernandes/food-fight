class CreateMonsters < ActiveRecord::Migration[6.0]
  def change
    create_table :monsters do |t|
      t.string :name
      t.integer :health
      t.string :image_name

      t.timestamps
    end
  end
end
