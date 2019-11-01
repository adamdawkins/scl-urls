class CreateModelRanges < ActiveRecord::Migration[6.0]
  def change
    create_table :model_ranges do |t|
      t.string :name
      t.string :slug
      t.belongs_to :manufacturer, null: false, foreign_key: true

      t.timestamps
    end
    add_index :model_ranges, :name, unique: true
    add_index :model_ranges, :slug, unique: true
  end
end
