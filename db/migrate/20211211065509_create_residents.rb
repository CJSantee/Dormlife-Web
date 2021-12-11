class CreateResidents < ActiveRecord::Migration[6.1]
  def change
    create_table :residents do |t|
      t.string :first_name 
      t.string :last_name 
      t.time :curfew
      t.string :phone_number 
      t.string :student_id
      t.string :email
      t.references :room
      t.timestamps
    end
  end
end
