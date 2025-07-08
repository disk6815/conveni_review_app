class AddConveniencestoreToProducts < ActiveRecord::Migration[7.2]
  def change
    add_reference :products, :conveniencestore, null: true, foreign_key: true
  end
end
