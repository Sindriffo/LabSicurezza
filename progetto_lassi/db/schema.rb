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

ActiveRecord::Schema.define(version: 20200905085324) do

  create_table "autocompletes", force: :cascade do |t|
    t.string "address"
    t.integer "street_number"
    t.string "locality"
    t.string "route"
    t.string "administrative_area_level_1"
    t.string "country"
    t.integer "postal_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "joinedtravels", force: :cascade do |t|
    t.integer "user_id"
    t.integer "travel_id"
    t.boolean "rated", default: false
    t.text "review"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["travel_id"], name: "index_joinedtravels_on_travel_id"
    t.index ["user_id"], name: "index_joinedtravels_on_user_id"
  end

  create_table "travels", force: :cascade do |t|
    t.integer "user_id"
    t.string "partenza"
    t.string "area_partenza"
    t.string "arrivo"
    t.string "area_arrivo"
    t.date "data"
    t.time "ora_partenza"
    t.float "prezzo"
    t.integer "posti_disponibili"
    t.boolean "rated", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_travels_on_user_id"
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "telefono"
    t.integer "segnalato", default: 0
    t.string "nome"
    t.string "cognome"
    t.float "rating"
    t.integer "ratingnum", default: 0
    t.boolean "sospeso", default: false
    t.boolean "admin", default: false
    t.string "image"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
