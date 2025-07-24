class ImageSizeValidator < ActiveModel::EachValidator
  MAX_SIZE = 10.megabytes

  def validate_each(record, attribute, value)
    return if value.blank?

    if value.size > MAX_SIZE
      record.errors.add(attribute, "のサイズが大きすぎます（10MB以下にしてください）")
    end
  end
end
