class Resident < ApplicationRecord
    require 'csv'
    belongs_to :room

    def self.import(file, headers)
        CSV.foreach(file.path, headers: true) do |row|
            hash = row.to_h
            
            puts hash
            
            # If header value == "Custom" use the alt value 
            college = College.find_by name: headers["college_header"] == "Custom" ? headers["college_alt"] : hash[headers["college_header"]]
            residence_hall = ResidenceHall.find_by name: headers["residence_hall_header"] == "Custom" ? headers["residence_hall_alt"] : hash[headers["residence_hall_header"]], college_id: college.id
            room = Room.find_by room_number: headers["room_header"] == "Custom" ? headers["room_alt"] : hash[headers["room_header"]], residence_hall_id: residence_hall.id
            
            # TODO: Add error handling

            if (college && residence_hall && room)
                Resident.create!(
                    first_name: hash[headers["first_name_header"]], 
                    last_name: hash[headers["last_name_header"]], 
                    curfew: headers["curfew_header"] == "Custom" ? headers["curfew_alt"] : hash[headers["curfew_header"]], 
                    phone_number: hash[headers["phone_number_header"]], 
                    student_id: hash[headers["student_id_header"]], 
                    email: hash[headers["email_header"]], 
                    room: room
                )
            else
                puts "ERROR CREATING RESIDENT"
            end
            
        end
    end
end
