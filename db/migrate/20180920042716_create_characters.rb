class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :name, default: '', null: false
      t.integer :level, default: 1, null: false
      t.float :experience, default: 0.0, null: false
      t.integer :energy, default: 100, null: false
      t.float :money, default: 0.0, null: false
      t.integer :strength, default: 1, null: false
      t.integer :agility, default: 1, null: false
      t.integer :intelligence, default: 1, null: false
      t.references :user

      t.timestamps
    end

    add_index :characters, :name, unique: true
  end
end
