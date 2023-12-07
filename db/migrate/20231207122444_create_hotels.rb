class CreateHotels < ActiveRecord::Migration[7.1]
  def change
    create_table :hotels do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
