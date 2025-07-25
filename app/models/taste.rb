class Taste < ApplicationRecord
  has_many :review_tastes
  has_many :reviews, through: :review_tastes

  def localized_name
    translation_key = convert_name_to_key(name)
    I18n.t("tastes.#{translation_key}", default: name)
  end

  private

  def convert_name_to_key(name)
    name_to_key_mapping = {
      "甘い" => "sweet",
    "少し甘い" => "little_sweet",
    "とても甘い" => "too_sweet",
    "辛い" => "spicy",
    "少し辛い" => "little_spicy",
    "とても辛い" => "too_spicy",
    "しょっぱい" => "salty",
    "少ししょっぱい" => "little_salty",
    "とてもしょっぱい" => "too_salty",
    "すっぱい" => "sour",
    "少しすっぱい" => "little_sour",
    "とてもすっぱい" => "too_sour",
    "苦い" => "bitter",
    "少し苦い" => "little_bitter",
    "とても苦い" => "too_bitter",
    "その他" => "other"
  } 
    name_to_key_mapping[name] || name.downcase.gsub(/[^a-z0-9]/, '_')
  end
end
