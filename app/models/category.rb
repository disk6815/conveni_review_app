class Category < ApplicationRecord
  has_many :review_categories
  has_many :reviews, through: :review_categories

  def localized_name
    # nameを翻訳キーに変換（例: "韓国料理" → "korean_food"）
    translation_key = convert_name_to_key(name)
    I18n.t("categories.#{translation_key}", default: name)
  end

  private

  def convert_name_to_key(name)
    # 日本語名から翻訳キーへの変換マッピング
    name_to_key_mapping = {
      #   '韓国料理' => 'korean_food',
      #   '日本料理' => 'japanese_food',
      #   '中華料理' => 'chinese_food',
      #   '洋食' => 'western_food',
      #   'スナック' => 'snack',
      #   'ドリンク' => 'drink',
      "デザート" => "dessert"
      #   'インスタント食品' => 'instant_food'
    }
    name_to_key_mapping[name] || name.downcase.gsub(/[^a-z0-9]/, "_")
  end
end
