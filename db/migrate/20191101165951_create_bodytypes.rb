class CreateBodytypes < ActiveRecord::Migration[6.0]
  def change
    create_table :bodytypes do |t|
      t.string :name

      t.timestamps
    end
    add_index :bodytypes, :name, unique: true
  end
end
