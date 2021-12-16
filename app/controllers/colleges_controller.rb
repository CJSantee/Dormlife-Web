class CollegesController < ApplicationController
    
    # GET /colleges
    # GET /colleges.json
    def index
        @colleges = College.all
        respond_to do |format|
            format.html 
            format.json {
                render :json => @colleges.to_json
            }
        end
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

    # GET /colleges/:id
    # GET /colleges/:id.json
    def show
        @college = College.find(params[:id])
        @residence_halls = @college.residence_halls
        respond_to do |format|
            format.html 
            format.json {
                render :json => @residence_halls.to_json
            }
        end
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

    def import 
        College.import(params[:file])
        redirect_to root_url
    end

    private
    def college_params
        params.require(:college).permit(:name)
    end
end
