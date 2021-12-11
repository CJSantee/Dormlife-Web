class ResidenceHallsController < ApplicationController
    before_action :get_college
    before_action :set_residence_hall, only: [:show, :edit, :update, :destroy]

    def index
        @residence_halls = @college.residence_halls
    end

    def show 
    end

    def new
        @residence_hall = @college.residence_halls.build
    end
    
    def edit 
    end

    def create
        @residence_hall = @college.residence_halls.build(residence_hall_params)
        if @residence_hall.save
            redirect_to @college
        end
    end

    def update
        @residence_hall.update!(residence_hall_params)
        redirect_to @college   
    end

    def destroy
        @residence_hall.destroy
        redirect_to college_path(@college)
    end
    
    private
    def get_college 
        @college = College.find(params[:college_id])
    end
    def set_residence_hall 
        @residence_hall = @college.residence_halls.find(params[:id])
    end
    def residence_hall_params
        params.require(:residence_hall).permit(:name, :college_id)
    end
end