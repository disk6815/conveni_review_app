class CreateReviewCategories < ActiveRecord::Migration[7.2]
  def change
    create_table :review_categories do |t|
      t.references :review, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
    add_index :review_categories, [:review_id, :category_id], unique: true
  end
end
