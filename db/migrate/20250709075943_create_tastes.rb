class CreateTastes < ActiveRecord::Migration[7.2]
  def change
    create_table :tastes do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
