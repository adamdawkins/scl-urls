class CreateChannels < ActiveRecord::Migration[6.0]
  def change
    create_table :channels do |t|
      t.string :name
      t.string :slug
      t.boolean :is_default, default: false

      t.timestamps
    end
    add_index :channels, :name, unique: true
    add_index :channels, :slug, unique: true
  end
end
