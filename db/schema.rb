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

ActiveRecord::Schema[7.1].define(version: 2023_12_07_154901) do
  create_table "bookings", force: :cascade do |t|
    t.string "booking_code", null: false
    t.datetime "start_date", null: false
    t.datetime "end_date", null: false
    t.decimal "total_price", null: false
    t.bigint "room_id", null: false
    t.decimal "room_price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_bookings_on_room_id"
  end

  create_table "hotels", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", null: false
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "room_code", null: false
    t.text "description", null: false
    t.bigint "hotel_id", null: false
    t.decimal "price_per_night", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hotel_id"], name: "index_rooms_on_hotel_id"
  end

end
