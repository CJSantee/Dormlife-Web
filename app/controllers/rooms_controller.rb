class RoomsController < ApplicationController
    before_action :get_residence_hall
    before_action :get_college
    before_action :set_room, only: [:show, :edit, :update, :destroy]

    def index
        @rooms = @residence_hall.rooms
    end

    def show
        @residents = @room.residents
    end

    def new
        @room = @residence_hall.rooms.build
    end

    def edit
    end

    def create
        @room = @residence_hall.rooms.build(room_params)
        if @room.save
            redirect_to college_residence_hall_path(@college, @residence_hall)
        end
    end

    def update
        @room.update!(room_params)
        redirect_to college_residence_hall_path(@college, @residence_hall)
    end

    def destroy
        @room.destroy
        redirect_to college_residence_hall_path(@college, @residence_hall)
    end

    private
    def get_college 
        @college = College.find(params[:college_id])
    end
    def get_residence_hall
        @residence_hall = ResidenceHall.find(params[:residence_hall_id])
    end
    def set_room
        @room = @residence_hall.rooms.find(params[:id])
    end
    def room_params
        params.require(:room).permit(:room_number, :residence_hall_id)
    end
end
