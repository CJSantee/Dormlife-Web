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

ActiveRecord::Schema.define(version: 2021_12_11_065509) do

  create_table "colleges", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "residence_halls", force: :cascade do |t|
    t.string "name"
    t.integer "college_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["college_id"], name: "index_residence_halls_on_college_id"
  end

  create_table "residents", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.time "curfew"
    t.string "phone_number"
    t.string "student_id"
    t.string "email"
    t.integer "room_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["room_id"], name: "index_residents_on_room_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "room_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "residence_hall_id", null: false
    t.index ["residence_hall_id"], name: "index_rooms_on_residence_hall_id"
  end

  add_foreign_key "rooms", "residence_halls"
end
