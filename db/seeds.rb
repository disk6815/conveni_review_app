# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
if Rails.env.production?
  Conveniencestore.find_or_create_by!(name: "SEVEN ELEVEN")
  Conveniencestore.find_or_create_by!(name: "Family Mart")
  Conveniencestore.find_or_create_by!(name: "LAWSON")
  Conveniencestore.find_or_create_by!(name: "MINISTOP")
  Conveniencestore.find_or_create_by!(name: "Daily Yamazaki")
  Conveniencestore.find_or_create_by!(name: "NewDays")
  Conveniencestore.find_or_create_by!(name: "Other")
end