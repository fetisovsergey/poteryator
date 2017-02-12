class CreateThings < ActiveRecord::Migration[5.0]
  def change
    create_table :things do |t|
      t.integer :user_id
      t.integer :root_type
      t.integer :thing_type
      t.float :longtitude
      t.float :latitude
      t.text :description
      t.string :address
      t.boolean :missing, :default => true
      t.timestamps
    end
  end
end
