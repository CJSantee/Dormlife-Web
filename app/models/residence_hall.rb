class ResidenceHall < ApplicationRecord
    require 'csv'
    belongs_to :college
    has_many :rooms, dependent: :destroy

    def self.import(file, college_id)
        CSV.foreach(file.path, headers: true) do |row|
            ResidenceHall.create!(name: row, college_id: college_id)
        end
    end
end
