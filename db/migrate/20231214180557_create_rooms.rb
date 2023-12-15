class CreateRooms < ActiveRecord::Migration[7.1]
  def change
    create_table :rooms do |t|
      t.string :room_code
      t.text :description
      t.decimal :price_per_night
      t.references :hotel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
