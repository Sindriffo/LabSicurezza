class User < ApplicationRecord
  has_many :joinedtravels
  has_many :travels
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, 
	 :omniauthable, :omniauth_providers => [:facebook]
end