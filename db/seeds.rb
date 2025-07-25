  # This file should ensure the existence of records required to run the application in every environment (production,
  # development, test). The code here should be idempotent so that it can be executed at any point in every environment.
  # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
  #
  # Example:
  #
  #   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
  #     MovieGenre.find_or_create_by!(name: genre_name)
  #   end
  # if Rails.env.production?
  Conveniencestore.find_or_create_by!(name: "SEVEN ELEVEN")
  Conveniencestore.find_or_create_by!(name: "Family Mart")
  Conveniencestore.find_or_create_by!(name: "LAWSON")
  Conveniencestore.find_or_create_by!(name: "MINISTOP")
  Conveniencestore.find_or_create_by!(name: "Daily Yamazaki")
  Conveniencestore.find_or_create_by!(name: "NewDays")
  Conveniencestore.find_or_create_by!(name: "Other")
  Category.find_or_create_by!(name: "おにぎり")
  Category.find_or_create_by!(name: "お寿司")
  Category.find_or_create_by!(name: "お弁当")
  Category.find_or_create_by!(name: "サンドイッチ・ロールパン")
  Category.find_or_create_by!(name: "パン")
  Category.find_or_create_by!(name: "ドーナツ")
  Category.find_or_create_by!(name: "そば・うどん・ラーメン・中華麺類")
  Category.find_or_create_by!(name: "パスタ")
  Category.find_or_create_by!(name: "グラタン・ドリア")
  Category.find_or_create_by!(name: "冷凍食品")
  Category.find_or_create_by!(name: "揚げ物・フランク・焼き鳥")
  Category.find_or_create_by!(name: "おでん")
  Category.find_or_create_by!(name: "中華まん")
  Category.find_or_create_by!(name: "サラダ")
  Category.find_or_create_by!(name: "スイーツ")
  Category.find_or_create_by!(name: "アイス")
  Category.find_or_create_by!(name: "飲料")
  Category.find_or_create_by!(name: "お酒")
  Category.find_or_create_by!(name: "お菓子")
  category = Category.find_by(name: "調味料・食材") || Category.find_by(name: "お惣菜")
  category.update!(name: "おつまみ・お惣菜") if category
  category = Category.find_by(name: "その他")
  category.touch if category
  Category.find_or_create_by!(name: "その他")
  Taste.find_or_create_by!(name: "甘い")
  Taste.find_or_create_by!(name: "少し甘い")
  Taste.find_or_create_by!(name: "とても甘い")
  Taste.find_or_create_by!(name: "辛い")
  Taste.find_or_create_by!(name: "少し辛い")
  Taste.find_or_create_by!(name: "とても辛い")
  Taste.find_or_create_by!(name: "しょっぱい")
  Taste.find_or_create_by!(name: "少ししょっぱい")
  Taste.find_or_create_by!(name: "とてもしょっぱい")
  Taste.find_or_create_by!(name: "すっぱい")
  Taste.find_or_create_by!(name: "少しすっぱい")
  Taste.find_or_create_by!(name: "とてもすっぱい")
  Taste.find_or_create_by!(name: "苦い")
  Taste.find_or_create_by!(name: "少し苦い")
  Taste.find_or_create_by!(name: "とても苦い")
  Taste.find_or_create_by!(name: "その他")
# end
