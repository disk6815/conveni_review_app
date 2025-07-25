class CreateReviews < ActiveRecord::Migration[7.2]
  def change
    create_table :reviews do |t|
      t.text :body
      t.float :rating
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
