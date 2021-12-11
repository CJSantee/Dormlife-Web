class AddFieldsToRooms < ActiveRecord::Migration[6.1]
  def change
    add_reference :rooms, :residence_hall, null: false, foreign_key: true
  end
end
