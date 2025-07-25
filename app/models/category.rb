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
        "おにぎり" => "onigiri",
        "お寿司" => "sushi",
        "お弁当" => "obento",
        "サンドイッチ・ロールパン" => "sandwich_roll",
        "パン" => "bread",
        "ドーナツ" => "doughnut",
        "そば・うどん・ラーメン・中華麺類" => "soba_udon",
        "パスタ" => "pasta",
        "グラタン・ドリア" => "gratin",
        "冷凍食品" => "frozen_food",
        "揚げ物・フランク・焼き鳥" => "fried_food",
        "おでん" => "oden",
        "中華まん" => "tyukaman",
        "サラダ" => "sarada",
        "スイーツ" => "sweet",
        "アイス" => "ice_cream",
        "飲料" => "drink",
        "お酒" => "alcohol",
        "お菓子" => "snack",
        "おつまみ・お惣菜" => "side_dish",
        "その他" => "other"
    }
    name_to_key_mapping[name] || name.downcase.gsub(/[^a-z0-9]/, "_")
  end
end
