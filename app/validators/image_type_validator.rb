class ImageTypeValidator < ActiveModel::EachValidator
  ALLOWED_TYPES = %w[image/jpeg image/png image/gif]

  def validate_each(record, attribute, value)
    return if value.blank?

    content_type = value.content_type
    unless ALLOWED_TYPES.include?(content_type)
      record.errors.add(attribute, I18n.t("errors.models.review_form.attributes.image.type"))
    end
  end
end
