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

ActiveRecord::Schema.define(version: 2021_10_24_183014) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "ccertificates", force: :cascade do |t|
    t.string "number"
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "consumption_id"
    t.index ["consumption_id"], name: "index_ccertificates_on_consumption_id"
  end

  create_table "consumers", force: :cascade do |t|
    t.integer "onec_id"
    t.string "name"
    t.string "full_name"
    t.string "edrpou"
    t.string "inn"
    t.text "director"
    t.text "bank"
    t.string "mfo"
    t.text "account"
    t.text "address"
    t.text "phone"
    t.string "mail"
    t.string "dog_en_number"
    t.date "dog_en_date"
    t.boolean "distribution", default: true
    t.string "client_username"
    t.string "manager_username"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "client_changed", default: false
  end

  create_table "consumptions", force: :cascade do |t|
    t.date "period"
    t.decimal "opening_balance", precision: 13, scale: 2
    t.decimal "money", precision: 13, scale: 2
    t.integer "power"
    t.decimal "cost", precision: 13, scale: 2
    t.decimal "closing_balance", precision: 13, scale: 2
    t.bigint "consumer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["consumer_id"], name: "index_consumptions_on_consumer_id"
  end

  create_table "dcertificates", force: :cascade do |t|
    t.string "number"
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "distribution_id"
    t.index ["distribution_id"], name: "index_dcertificates_on_distribution_id"
  end

  create_table "distributions", force: :cascade do |t|
    t.date "period"
    t.decimal "opening_balance", precision: 13, scale: 2
    t.decimal "money", precision: 13, scale: 2
    t.decimal "cost", precision: 13, scale: 2
    t.decimal "closing_balance", precision: 13, scale: 2
    t.bigint "consumer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["consumer_id"], name: "index_distributions_on_consumer_id"
  end

  create_table "ftp_profiles", force: :cascade do |t|
    t.string "host"
    t.integer "port", default: 21
    t.string "username"
    t.string "password"
    t.boolean "default", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "date"
    t.integer "period"
    t.integer "percent"
    t.bigint "consumer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["consumer_id"], name: "index_payments_on_consumer_id"
  end

  create_table "purveyors", force: :cascade do |t|
    t.text "full_name"
    t.text "director"
    t.string "edrpou"
    t.string "inn"
    t.text "account"
    t.text "bank"
    t.string "mfo"
    t.string "address"
    t.text "phone"
    t.string "mail"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "name", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "admin_role", default: false
    t.boolean "manager_role", default: false
    t.boolean "client_role", default: true
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "ccertificates", "consumptions"
  add_foreign_key "consumptions", "consumers"
  add_foreign_key "dcertificates", "distributions"
  add_foreign_key "distributions", "consumers"
  add_foreign_key "payments", "consumers"
end
