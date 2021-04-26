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

ActiveRecord::Schema.define(version: 2021_04_26_183941) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  add_foreign_key "payments", "consumers"
end
