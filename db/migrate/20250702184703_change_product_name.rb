class ChangeProductName < ActiveRecord::Migration[7.2]
  def change
    change_column :products, :name, :string, null: false
  end
end
