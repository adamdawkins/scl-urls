class CreateManufacturers < ActiveRecord::Migration[6.0]
  def change
    create_table :manufacturers do |t|
      t.string :name
      t.string :slug

      t.timestamps
    end
    add_index :manufacturers, :name, unique: true
    add_index :manufacturers, :slug, unique: true
  end
end
