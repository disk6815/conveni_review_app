module ApplicationHelper
  def localized_category_options
    Category.all.map do |category|
      [ category.localized_name, category.id ]
    end
  end

  def display_category_name(review)
    return t("defaults.none") unless review.categories.present?
    review.categories.first.localized_name
  end
end
