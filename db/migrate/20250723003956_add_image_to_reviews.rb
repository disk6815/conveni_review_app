class AddImageToReviews < ActiveRecord::Migration[7.2]
  def change
    add_column :reviews, :image, :string
  end
end
