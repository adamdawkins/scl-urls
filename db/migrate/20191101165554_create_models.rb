class CreateModels < ActiveRecord::Migration[6.0]
  def change
    create_table :models do |t|
      t.string :name
      t.string :slug
      t.belongs_to :model_range, null: false, foreign_key: true

      t.timestamps
    end
    add_index :models, :name, unique: true
    add_index :models, :slug, unique: true
  end
end
