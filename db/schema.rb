# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_28_163656) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "company_sales", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "purchaser_name"
    t.string "item_description"
    t.float "item_price"
    t.integer "purchase_count"
    t.string "merchant_address"
    t.string "merchant_name"
    t.bigint "purchaser_id", null: false
    t.bigint "merchant_id", null: false
    t.bigint "item_id", null: false
    t.index ["item_id"], name: "index_company_sales_on_item_id"
    t.index ["merchant_id"], name: "index_company_sales_on_merchant_id"
    t.index ["purchaser_id"], name: "index_company_sales_on_purchaser_id"
    t.index ["user_id"], name: "index_company_sales_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "description"
    t.float "price"
    t.bigint "merchant_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["merchant_id"], name: "index_items_on_merchant_id"
  end

  create_table "merchants", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "purchasers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "company_sales", "items"
  add_foreign_key "company_sales", "merchants"
  add_foreign_key "company_sales", "purchasers"
  add_foreign_key "company_sales", "users"
  add_foreign_key "items", "merchants"
end
