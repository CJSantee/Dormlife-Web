class Room < ApplicationRecord
    belongs_to :residence_hall
    has_many :residents
end
