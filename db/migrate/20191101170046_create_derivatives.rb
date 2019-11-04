class CreateDerivatives < ActiveRecord::Migration[6.0]
  def change
    create_table :derivatives do |t|
      t.string :capcode
      t.string :name
      t.string :slug
      t.belongs_to :bodytype, null: false, foreign_key: true
      t.string :transmission
      t.string :fueltype
      t.integer :doors

      t.belongs_to :model, null: false, foreign_key: true

      t.timestamps
    end
    add_index :derivatives, :slug, unique: true
  end
end
