class CreateMonsters < ActiveRecord::Migration[6.0]
  def change
    create_table :monsters do |t|
      t.string :name
      t.string :image_url
      t.integer :health

      t.timestamps
    end
  end
end
