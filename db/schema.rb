# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_01_30_155348) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "asset_tags", force: :cascade do |t|
    t.string "tag"
    t.bigint "consumable_id"
    t.bigint "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "fixed_asset_id"
    t.index ["consumable_id"], name: "index_asset_tags_on_consumable_id"
    t.index ["fixed_asset_id"], name: "index_asset_tags_on_fixed_asset_id"
    t.index ["location_id"], name: "index_asset_tags_on_location_id"
  end

  create_table "audits", force: :cascade do |t|
    t.integer "auditable_id"
    t.string "auditable_type"
    t.integer "associated_id"
    t.string "associated_type"
    t.integer "user_id"
    t.string "user_type"
    t.string "username"
    t.string "action"
    t.jsonb "audited_changes"
    t.integer "version", default: 0
    t.string "comment"
    t.string "remote_address"
    t.string "request_uuid"
    t.datetime "created_at"
    t.index ["associated_type", "associated_id"], name: "associated_index"
    t.index ["auditable_type", "auditable_id", "version"], name: "auditable_index"
    t.index ["created_at"], name: "index_audits_on_created_at"
    t.index ["request_uuid"], name: "index_audits_on_request_uuid"
    t.index ["user_id", "user_type"], name: "user_index"
  end

  create_table "consumables", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "quantity"
    t.integer "reorderAmount"
    t.string "shelf"
    t.string "bin"
    t.boolean "obsolete"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "part_number"
    t.string "mfg_part_number"
    t.bigint "part_id"
    t.index ["part_id"], name: "index_consumables_on_part_id"
  end

  create_table "fixed_assets", force: :cascade do |t|
    t.string "InstalledLocation"
    t.string "RackUnit"
    t.bigint "part_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.string "serial_number"
    t.boolean "disposed"
    t.string "primary_mac"
    t.index ["part_id"], name: "index_fixed_assets_on_part_id"
  end

  create_table "line_items", force: :cascade do |t|
    t.bigint "consumable_id"
    t.bigint "order_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["consumable_id"], name: "index_line_items_on_consumable_id"
    t.index ["order_id"], name: "index_line_items_on_order_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string "order_id"
    t.string "user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.boolean "finalized"
    t.boolean "removed_stock"
  end

  create_table "parts", force: :cascade do |t|
    t.string "internal_part"
    t.string "mfg_part"
    t.text "name"
    t.text "description"
    t.string "manufacturer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.bigint "searchable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "asset_tags", "consumables"
  add_foreign_key "asset_tags", "fixed_assets"
  add_foreign_key "asset_tags", "locations"
  add_foreign_key "consumables", "parts"
  add_foreign_key "fixed_assets", "parts"
  add_foreign_key "line_items", "consumables"
  add_foreign_key "line_items", "orders"
end
