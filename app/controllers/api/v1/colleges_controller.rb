class Api::V1::CollegesController < ApplicationController
    
    # GET /api/v1/colleges
    def index
        @colleges = College.all.order(name: :asc)
        render json: @colleges
    end

    def new
        @college = College.new
    end

    def create
        @college = College.new(college_params)
        if @college.save 
            redirect_to "/colleges"
        else 
            render '/colleges/new'
        end
    end

    # GET /api/v1/colleges/:id
    def show
        @college = College.find(params[:id])
        @residence_halls = @college.residence_halls
        render json: @residence_halls
    end

    def edit
        @college = College.find(params[:id])
    end

    def update
        @college = College.find(params[:id])
        @college.update!(college_params)
        redirect_to @college        
    end

    def destroy
        @college = College.find(params[:id]).destroy
    end

    def import 
        College.import(params[:file])
        redirect_to root_url
    end

    private
    def college_params
        params.require(:college).permit(:name)
    end
end
