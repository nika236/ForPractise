class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.string :booking_code, null: false
      t.datetime :start_date, null: false
      t.datetime :end_date, null: false
      t.decimal :total_price, null: false
      t.bigint :room_id, null: false
      t.decimal :room_price, null: false
      t.index ["room_id"], name: "index_bookings_on_room_id"
      t.timestamps
    end
  end
end
