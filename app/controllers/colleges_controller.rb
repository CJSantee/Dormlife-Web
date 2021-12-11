class CollegesController < ApplicationController
    def index
        @colleges = College.all
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

    def show
        @college = College.find(params[:id])
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
        redirect_to "/colleges"
    end

    private
    def college_params
        params.require(:college).permit(:name)
    end
end
