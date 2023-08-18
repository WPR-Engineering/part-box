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

ActiveRecord::Schema[7.0].define(version: 2023_08_18_051849) do
  create_table "asset_tags", force: :cascade do |t|
    t.string "tag"
    t.integer "consumable_id"
    t.integer "location_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "fixed_asset_id"
    t.boolean "preprinted_tag"
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
    t.json "audited_changes"
    t.integer "version", default: 0
    t.string "comment"
    t.string "remote_address"
    t.string "request_uuid"
    t.datetime "created_at", precision: nil
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
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "part_number"
    t.string "mfg_part_number"
    t.integer "part_id"
    t.string "category"
    t.boolean "overstock"
    t.integer "overstock_quantity"
    t.string "overstock_location"
    t.text "overstock_notes"
    t.string "site"
    t.index ["part_id"], name: "index_consumables_on_part_id"
  end

  create_table "fixed_assets", force: :cascade do |t|
    t.string "InstalledLocation"
    t.string "RackUnit"
    t.integer "part_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.text "description"
    t.string "serial_number"
    t.boolean "disposed"
    t.string "primary_mac"
    t.text "disposal_note"
    t.integer "purchase_price"
    t.index ["part_id"], name: "index_fixed_assets_on_part_id"
  end

  create_table "item_tags", force: :cascade do |t|
    t.string "tag_number"
    t.integer "container_quantity"
    t.boolean "auto_removed"
    t.integer "consumable_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["consumable_id"], name: "index_item_tags_on_consumable_id"
  end

  create_table "line_items", force: :cascade do |t|
    t.integer "consumable_id"
    t.integer "order_id"
    t.integer "quantity"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["consumable_id"], name: "index_line_items_on_consumable_id"
    t.index ["order_id"], name: "index_line_items_on_order_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string "order_id"
    t.string "user"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
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
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "part_type"
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.integer "searchable_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id"
  end

# Could not dump table "users" because of following StandardError
#   Unknown type 'inet' for column 'current_sign_in_ip'

  create_table "version_associations", force: :cascade do |t|
    t.integer "version_id"
    t.string "foreign_key_name", null: false
    t.integer "foreign_key_id"
    t.string "foreign_type"
    t.index ["foreign_key_name", "foreign_key_id", "foreign_type"], name: "index_version_associations_on_foreign_key"
    t.index ["version_id"], name: "index_version_associations_on_version_id"
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type"
    t.string "{:null=>false}"
    t.bigint "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object", limit: 1073741823
    t.datetime "created_at", precision: nil
    t.text "object_changes", limit: 1073741823
    t.integer "transaction_id"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
    t.index ["transaction_id"], name: "index_versions_on_transaction_id"
  end

  add_foreign_key "asset_tags", "consumables"
  add_foreign_key "asset_tags", "fixed_assets"
  add_foreign_key "asset_tags", "locations"
  add_foreign_key "consumables", "parts"
  add_foreign_key "fixed_assets", "parts"
  add_foreign_key "item_tags", "consumables"
  add_foreign_key "line_items", "consumables"
  add_foreign_key "line_items", "orders"
end
