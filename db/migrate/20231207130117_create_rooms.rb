class CreateRooms < ActiveRecord::Migration[7.1]
  def change
    create_table :rooms do |t|
      t.integer :room_code, null:false
      t.text :description, null:false
      t.bigint :hotel_id , null:false
      t.decimal :price_per_night, null:false
      t.index ["hotel_id"], name: "index_rooms_on_hotel_id"
      t.timestamps
    end
  end
end
