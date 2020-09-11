class Travel < ApplicationRecord
    validates_presence_of :user_id
    validates_presence_of :partenza
    validates_presence_of :arrivo
    validates_presence_of :data
    validates_presence_of :ora_partenza
    validates_presence_of :prezzo
    validates_presence_of :posti_disponibili
    has_many :joinedtravels
    belongs_to :user,optional: true
end
