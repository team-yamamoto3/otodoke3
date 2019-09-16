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

ActiveRecord::Schema.define(version: 2019_09_16_084750) do

  create_table "addresses", force: :cascade do |t|
    t.string "tell"
    t.text "postal_code"
    t.text "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "arrivals", force: :cascade do |t|
    t.integer "arrival_new"
    t.datetime "arrival_day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cd_id"
  end

  create_table "artists", force: :cascade do |t|
    t.string "artist"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cd_id"
  end

  create_table "carts", force: :cascade do |t|
    t.integer "cartnumber"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "cd_id"
  end

  create_table "cds", force: :cascade do |t|
    t.string "sales_status", default: "販売中"
    t.integer "price"
    t.decimal "consumption_tax", default: "1.08"
    t.integer "stock"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "genre"
    t.string "jacket"
    t.string "label"
    t.integer "artist_id"
    t.integer "song_id"
    t.text "jacket_id"
  end

  create_table "discs", force: :cascade do |t|
    t.string "disc_name"
    t.integer "include"
    t.integer "disc_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "endusers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "last_name"
    t.string "first_name"
    t.string "user_tell"
    t.text "user_address"
    t.string "postal_code"
    t.boolean "unsubscribe"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "last_name_kana"
    t.string "first_name_kana"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_endusers_on_deleted_at"
    t.index ["email"], name: "index_endusers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_endusers_on_reset_password_token", unique: true
  end

  create_table "genres", force: :cascade do |t|
    t.string "genre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jackets", force: :cascade do |t|
    t.string "cd_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "labels", force: :cascade do |t|
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "order_number"
    t.integer "cd_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "receipts", force: :cascade do |t|
    t.string "order_status", default: "準備中"
    t.text "payment", default: "代引き"
    t.integer "postage", default: 500
    t.integer "sum_price"
    t.integer "user_id"
    t.integer "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "songs", force: :cascade do |t|
    t.string "song"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "songorder"
    t.integer "disc_id"
    t.integer "cd_id"
  end

  create_table "titles", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
