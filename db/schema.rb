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

ActiveRecord::Schema.define(version: 2022_11_16_041917) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "auctify_bidder_registrations", force: :cascade do |t|
    t.string "bidder_type", null: false
    t.bigint "bidder_id", null: false
    t.bigint "auction_id", null: false
    t.string "aasm_state", default: "pending", null: false
    t.datetime "handled_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "dont_confirm_bids", default: false
    t.index ["aasm_state"], name: "index_auctify_bidder_registrations_on_aasm_state"
    t.index ["auction_id"], name: "index_auctify_bidder_registrations_on_auction_id"
    t.index ["bidder_type", "bidder_id"], name: "index_auctify_bidder_registrations_on_bidder"
  end

  create_table "auctify_bids", force: :cascade do |t|
    t.bigint "registration_id", null: false
    t.decimal "price", precision: 12, scale: 2, null: false
    t.decimal "max_price", precision: 12, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "cancelled", default: false
    t.boolean "autobid", default: false
    t.index ["cancelled"], name: "index_auctify_bids_on_cancelled"
    t.index ["registration_id"], name: "index_auctify_bids_on_registration_id"
  end

  create_table "auctify_sales", force: :cascade do |t|
    t.string "seller_type"
    t.integer "seller_id"
    t.string "buyer_type"
    t.bigint "buyer_id"
    t.bigint "item_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "type", default: "Auctify::Sale::Base"
    t.string "aasm_state", default: "offered", null: false
    t.decimal "offered_price", precision: 12, scale: 2
    t.decimal "current_price", precision: 12, scale: 2
    t.decimal "sold_price", precision: 12, scale: 2
    t.jsonb "bid_steps_ladder"
    t.decimal "reserve_price"
    t.bigint "pack_id"
    t.datetime "ends_at"
    t.integer "position"
    t.string "number"
    t.datetime "currently_ends_at"
    t.boolean "published", default: false
    t.string "slug"
    t.string "contract_number"
    t.integer "seller_commission_in_percent"
    t.string "winner_type"
    t.bigint "winner_id"
    t.integer "applied_bids_count", default: 0
    t.datetime "sold_at"
    t.string "current_winner_type"
    t.bigint "current_winner_id"
    t.integer "buyer_commission_in_percent"
    t.integer "featured"
    t.index ["buyer_type", "buyer_id"], name: "index_auctify_sales_on_buyer_type_and_buyer_id"
    t.index ["currently_ends_at"], name: "index_auctify_sales_on_currently_ends_at"
    t.index ["featured"], name: "index_auctify_sales_on_featured"
    t.index ["pack_id"], name: "index_auctify_sales_on_pack_id"
    t.index ["position"], name: "index_auctify_sales_on_position"
    t.index ["published"], name: "index_auctify_sales_on_published"
    t.index ["seller_type", "seller_id"], name: "index_auctify_sales_on_seller_type_and_seller_id"
    t.index ["slug"], name: "index_auctify_sales_on_slug", unique: true
    t.index ["winner_type", "winner_id"], name: "index_auctify_sales_on_winner_type_and_winner_id"
  end

  create_table "auctify_sales_packs", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "position", default: 0
    t.string "slug"
    t.string "place"
    t.boolean "published", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "sales_count", default: 0
    t.date "start_date"
    t.date "end_date"
    t.integer "sales_interval", default: 3
    t.integer "sales_beginning_hour", default: 20
    t.integer "sales_beginning_minutes", default: 0
    t.integer "commission_in_percent"
    t.integer "auction_prolonging_limit_in_seconds"
    t.index ["position"], name: "index_auctify_sales_packs_on_position"
    t.index ["published"], name: "index_auctify_sales_packs_on_published"
    t.index ["slug"], name: "index_auctify_sales_packs_on_slug", unique: true
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "name"
    t.string "title"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.string "slug"
    t.index ["slug"], name: "index_posts_on_slug", unique: true
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "auctify_bidder_registrations", "auctify_sales", column: "auction_id"
  add_foreign_key "auctify_bids", "auctify_bidder_registrations", column: "registration_id"
  add_foreign_key "posts", "users"
end
