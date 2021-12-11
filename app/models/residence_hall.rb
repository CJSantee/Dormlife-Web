class ResidenceHall < ApplicationRecord
    belongs_to :college
    has_many :rooms, dependent: :destroy
end
