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

ActiveRecord::Schema[7.0].define(version: 2023_02_02_171229) do
  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.integer "phone_number"
    t.boolean "boss"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.integer "amount_of_logins", default: 0
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "product_id", null: false
    t.integer "amount"
    t.float "total_price"
    t.integer "employee_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_orders_on_employee_id"
    t.index ["product_id"], name: "index_orders_on_product_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "pictures", force: :cascade do |t|
    t.string "picture_url"
    t.integer "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_pictures_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.float "cost"
    t.integer "inventory"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rented_samples", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "employee_id", null: false
    t.integer "sample_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_rented_samples_on_employee_id"
    t.index ["sample_id"], name: "index_rented_samples_on_sample_id"
    t.index ["user_id"], name: "index_rented_samples_on_user_id"
  end

  create_table "samples", force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "inventory"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_samples_on_product_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.integer "phone_number"
    t.string "address"
    t.string "city"
    t.string "state"
    t.integer "zip_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "orders", "employees"
  add_foreign_key "orders", "products"
  add_foreign_key "orders", "users"
  add_foreign_key "pictures", "products"
  add_foreign_key "rented_samples", "employees"
  add_foreign_key "rented_samples", "samples"
  add_foreign_key "rented_samples", "users"
  add_foreign_key "samples", "products"
end
