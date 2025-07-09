# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2025_07_09_083251) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conveniencestores", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.integer "price"
    t.boolean "is_official", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "conveniencestore_id"
    t.index ["conveniencestore_id"], name: "index_products_on_conveniencestore_id"
  end

  create_table "review_categories", force: :cascade do |t|
    t.bigint "review_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_review_categories_on_category_id"
    t.index ["review_id", "category_id"], name: "index_review_categories_on_review_id_and_category_id", unique: true
    t.index ["review_id"], name: "index_review_categories_on_review_id"
  end

  create_table "review_tastes", force: :cascade do |t|
    t.bigint "review_id", null: false
    t.bigint "taste_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["review_id"], name: "index_review_tastes_on_review_id"
    t.index ["taste_id"], name: "index_review_tastes_on_taste_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "body"
    t.float "rating"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "product_id", null: false
    t.index ["product_id"], name: "index_reviews_on_product_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "tastes", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", default: "", null: false
    t.integer "nationality", default: 0, null: false
    t.integer "language", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "products", "conveniencestores"
  add_foreign_key "review_categories", "categories"
  add_foreign_key "review_categories", "reviews"
  add_foreign_key "review_tastes", "reviews"
  add_foreign_key "review_tastes", "tastes"
  add_foreign_key "reviews", "products"
  add_foreign_key "reviews", "users"
end
