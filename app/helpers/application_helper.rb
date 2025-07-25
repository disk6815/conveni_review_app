module ApplicationHelper
  def localized_category_options
    Category.all.map do |category|
      [ category.localized_name, category.id ]
    end
  end

  def localized_taste_options
    Taste.all.map do |taste|
      [taste.localized_name, taste.id]
    end
  end
end
