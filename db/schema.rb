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

ActiveRecord::Schema[7.0].define(version: 2024_06_14_104702) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "deal_items", force: :cascade do |t|
    t.bigint "deal_id", null: false
    t.bigint "item_id", null: false
    t.decimal "deal_price", precision: 10, scale: 2, null: false
    t.decimal "deal_discount", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deal_id"], name: "index_deal_items_on_deal_id"
    t.index ["item_id", "deal_id"], name: "index_deal_items_on_item_id_and_deal_id", unique: true
    t.index ["item_id"], name: "index_deal_items_on_item_id"
  end

  create_table "deals", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.datetime "start_date", null: false
    t.datetime "end_date", null: false
    t.decimal "overall_discount", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "name", null: false
    t.decimal "price", precision: 10, scale: 2, null: false
    t.decimal "tax_rate", precision: 10, scale: 2, null: false
    t.string "discount_type", null: false
    t.decimal "discount_amount", precision: 10, scale: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.bigint "order_id", null: false
    t.integer "quantity", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_order_items_on_item_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.decimal "order_total", precision: 10, scale: 2
    t.integer "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "jti", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "deal_items", "deals"
  add_foreign_key "deal_items", "items"
  add_foreign_key "order_items", "items"
  add_foreign_key "order_items", "orders"
  add_foreign_key "orders", "users"
end
