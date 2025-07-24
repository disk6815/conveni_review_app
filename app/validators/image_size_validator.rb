class ImageSizeValidator < ActiveModel::EachValidator
  MAX_SIZE = 10.megabytes

  def validate_each(record, attribute, value)
    return if value.blank?

    if value.size > MAX_SIZE
      record.errors.add(attribute, :size, message: I18n.t("errors.models.review_form.attributes.image.size"))
    end
  end
end
