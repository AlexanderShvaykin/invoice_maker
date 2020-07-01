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

ActiveRecord::Schema.define(version: 2020_07_12_175221) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "banks", force: :cascade do |t|
    t.string "name"
    t.string "bic"
    t.string "order"
    t.string "bank_order"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "citizen_id"
    t.index ["citizen_id"], name: "index_banks_on_citizen_id"
  end

  create_table "citizens", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.string "last_name"
    t.string "middle_name"
    t.string "inn"
    t.string "address"
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_citizens_on_user_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "organization_id", null: false
    t.string "number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "bank_id", null: false
    t.index ["bank_id"], name: "index_invoices_on_bank_id"
    t.index ["organization_id"], name: "index_invoices_on_organization_id"
    t.index ["user_id"], name: "index_invoices_on_user_id"
  end

  create_table "invoices_items", force: :cascade do |t|
    t.bigint "invoice_id", null: false
    t.string "name"
    t.integer "count"
    t.integer "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["invoice_id"], name: "index_invoices_items_on_invoice_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone"
    t.string "inn"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_organizations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "banks", "citizens"
  add_foreign_key "citizens", "users"
  add_foreign_key "invoices", "banks"
  add_foreign_key "invoices", "organizations"
  add_foreign_key "invoices", "users"
  add_foreign_key "invoices_items", "invoices"
  add_foreign_key "organizations", "users"
end
