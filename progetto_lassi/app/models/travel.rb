class Travel < ApplicationRecord
    has_many :joinedtravels
    belongs_to :user,optional: true
end
