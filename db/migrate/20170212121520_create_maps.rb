class CreateMaps < ActiveRecord::Migration[5.0]
  def change
    create_table :maps do |t|
      t.integer :zoom
      t.integer :user_id
      t.string :radius
      t.string :float
      t.float :latitude
      t.float :longtitude
      t.string :address
      t.timestamps
    end
  end
end
