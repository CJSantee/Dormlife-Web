class ResidentsController < ApplicationController
    def index
        @residents = Resident.all
    end

    def show
        @resident = Resident.find(params[:id])
        @room = Room.find(@resident.room_id)
        @residence_hall = ResidenceHall.find(@room.residence_hall_id)
        @college = College.find(@residence_hall.college_id)
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

    def edit
        @resident = Resident.find(params[:id])
        @rooms = Room.all
    end

    def update
        @resident = Resident.find(params[:id])
        @resident.update!(resident_params)
        redirect_to '/residents'
    end

    def destroy
        @resident = Resident.find(params[:id])
        @resident.destroy
        redirect_to '/residents'
    end

    def resident_params
        params.require(:resident).permit(:first_name, :last_name, :curfew, :phone_number, :student_id, :email, :room_id)
    end
end
