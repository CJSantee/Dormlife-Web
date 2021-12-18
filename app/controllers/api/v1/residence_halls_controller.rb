class Api::V1::ResidenceHallsController < ApplicationController
    before_action :get_college
    before_action :set_residence_hall, only: [:show, :edit, :update, :destroy]

    # BUG: Missing Template
    def index
        @residence_halls = @college.residence_halls
    end

    # GET /colleges/:college_id/residence_halls/:id
    # GET /colleges/:college_id/residence_halls/:id.json
    def show 
        @rooms = @residence_hall.rooms
        respond_to do |format|
            format.html 
            format.js 
            format.json {
                render :json => @rooms.to_json
            }
        end
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
        redirect_to @college
    end

    def import
        ResidenceHall.import(params[:file], params[:college_id])
        redirect_to @college
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