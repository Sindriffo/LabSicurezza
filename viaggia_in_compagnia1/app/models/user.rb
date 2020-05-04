class User < ApplicationRecord
    has_many :joinedtravels
    has_many :travels
end
