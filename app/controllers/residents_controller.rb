class ResidentsController < ApplicationController
    def index
        @residents = Resident.all
    end

    def new
        @resident = Resident.new
        @rooms = Room.all
    end
    
    def create 
        @resident = Resident.new(resident_params)
        if @resident.save 
            redirect_to '/residents'
        end
    end

    def resident_params
        params.require(:resident).permit(:first_name, :last_name, :curfew, :phone_number, :student_id, :email, :room_id)
    end
end
