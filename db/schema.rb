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

ActiveRecord::Schema.define(version: 2020_04_19_232824) do

  create_table "feedbacks", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "meetings", force: :cascade do |t|
    t.string "name"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "professional_id"
    t.string "room"
    t.string "password"
    t.integer "user_id"
    t.index ["professional_id"], name: "index_meetings_on_professional_id"
    t.index ["user_id"], name: "index_meetings_on_user_id"
  end

  create_table "professionals", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "service_id"
    t.integer "user_id"
    t.string "stripe_user_id"
    t.index ["service_id"], name: "index_professionals_on_service_id"
    t.index ["user_id"], name: "index_professionals_on_user_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "category"
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "role"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "meetings", "professionals"
  add_foreign_key "meetings", "users"
  add_foreign_key "professionals", "services"
  add_foreign_key "professionals", "users"
end
