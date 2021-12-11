class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :room_number
      t.references :residence_hall
      t.timestamps
    end
  end
end
