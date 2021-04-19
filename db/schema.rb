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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2021_04_15_061219) do
=======
ActiveRecord::Schema.define(version: 2021_04_12_091412) do
>>>>>>> 120ab5ff (init devise gem)

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "order_positions", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "restaurant_order_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_order_positions_on_product_id"
    t.index ["restaurant_order_id"], name: "index_order_positions_on_restaurant_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id"
    t.boolean "approved"
    t.integer "status", default: 0
    t.integer "payment_type", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name", null: false
    t.money "price", scale: 2, null: false
    t.string "category", null: false
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "restaurant_orders", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "order_id"
    t.boolean "approved"
    t.integer "status", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_restaurant_orders_on_order_id"
    t.index ["user_id"], name: "index_restaurant_orders_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "phone_number", null: false
    t.integer "user_type", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
<<<<<<< HEAD
<<<<<<< HEAD
    t.boolean "confirmed", default: false
=======
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
>>>>>>> a82b9f06 (changed migrations)
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["phone_number"], name: "index_users_on_phone_number", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
=======
>>>>>>> 51ac97e8 (added phone confirmation)
  end

end
