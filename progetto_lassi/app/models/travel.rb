class Travel < ApplicationRecord
    has_many :joinedtravels
    belongs_to :user
end
