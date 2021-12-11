class College < ApplicationRecord
    require 'csv'
    has_many :residence_halls, dependent: :destroy

    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
            College.create!(name: row)
        end
    end
end
