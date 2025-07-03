class CreateProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.boolean :is_official, default: false
      t.timestamps
    end
  end
end
