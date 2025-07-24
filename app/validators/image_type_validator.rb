class ImageTypeValidator < ActiveModel::EachValidator
  ALLOWED_TYPES = %w[image/jpeg image/png image/gif]

  def validate_each(record, attribute, value)
    return if value.blank?

    content_type = value.content_type
    unless ALLOWED_TYPES.include?(content_type)
      record.errors.add(attribute, "のファイル形式が無効です（jpg, png, gifのみ対応）")
    end
  end
end
