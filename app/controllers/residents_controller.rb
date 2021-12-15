class ResidentsController < ApplicationController
    require 'csv'

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
        @colleges = College.all
        @residence_halls = ResidenceHall.all
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

    def import 
        puts "----- PARAMS -----"
        params.each do |key, value|
            print "#{key} => #{value} \n"
        end
        puts "----- PARAMS -----"
     
        puts "ORIGINAL FILENAME: #{params[:filename]}"
        path = Rails.root.join('public', 'uploads', params[:filename])
        File.open(path) do |file|
            puts "FILEPATH: #{file.path}"
            Resident.import(file)
        end
        File.delete(path) if File.exist?(path)
        # Resident.import(params[:file])
        redirect_to '/residents'
    end

    def csv 
        @file = params[:file]
        puts "Filetype CSV: #{@file.class}"
        File.open(Rails.root.join('public', 'uploads', @file.original_filename), 'w') do |file|
            file.write(@file.read)
        end

        @rows = CSV.read(params[:file])
        @headers = @rows.first
        @headers.append("Custom")
    end

    private
    def resident_params
        params.require(:resident).permit(:first_name, :last_name, :curfew, :phone_number, :student_id, :email, :room_id)
    end
end
