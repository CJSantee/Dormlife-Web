class Resident < ApplicationRecord
    require 'csv'
    belongs_to :room

    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
            # Resident.create!(name: row)
            hash = row.to_h
            
            puts hash

            college = College.find_by name: hash["college"]
            residence_hall = ResidenceHall.find_by name: hash["residence_hall"], college_id: college.id
            room = Room.find_by room_number: hash["room_number"], residence_hall_id: residence_hall.id
            
            if (college && residence_hall && room)
                puts "College ID: #{college.id}"
                puts "Residence Hall ID: #{residence_hall.id}"
                puts "Room ID: #{room.id}"
                Resident.create!(first_name: hash["first_name"], last_name: hash["last_name"], curfew: hash["curfew"], phone_number: hash["phone_number"], student_id: hash["student_id"], email: hash["email"], room: room)
            else
                puts "ERROR CREATING RESIDENT"
            end
            
        end
    end
end
