class College < ApplicationRecord
    has_many :residence_halls, dependent: :destroy
end
