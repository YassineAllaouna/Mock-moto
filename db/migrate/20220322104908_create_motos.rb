class CreateMotos < ActiveRecord::Migration[6.1]
  def change
    create_table :motos do |t|
      t.string :model
      t.string :brand
      t.string :address
      t.integer :power
      t.integer :kilometers

      t.timestamps
    end
  end
end
