class JoinedtravelsController < ApplicationController

	before_action :authenticate_user!


	def index
			id = params[:format]
			if id != nil
				redirect_to joinedtravels_path()
			end
		
			id = current_user.id
			if User.exists?(id)
				@user = User.find(id)
				@past_travels = Travel.where('travels.data < ?', DateTime.now.midnight)
				@future_travels = Travel.where('travels.data >= ?', DateTime.now.midnight)
				
				@created_past_travels = Travel.where('travels.user_id == ?', id).where('travels.data < ?', DateTime.now.midnight)
												.where('travels.rated == ?', false)
				
				@past_joinedtravels = @past_travels.joins(:joinedtravels).where('joinedtravels.user_id == ?', @user.id)
												.where('joinedtravels.rated == ?', false)
				
				@past_travels = []
	
				@created_past_travels.each do |travel|
					@past_travels << travel
				end
				@past_joinedtravels.each do |travel|
					@past_travels << travel
				end


				@future_joinedtravels = @future_travels.joins(:joinedtravels).where('joinedtravels.user_id == ?', id)
				@created_travels = Travel.where('travels.user_id == ?', id).where('travels.data >= ?', DateTime.now.midnight)

			else
				render html: 'Error! User does not exit'
			end
		end

		def new
			id = params[:format]
			user_id = current_user.id
			@jt = Joinedtravel.new(:user_id => user_id, :travel_id => id)
			@jt.save
			@travel = Travel.find(id)
			@travel.posti_disponibili -= 1
			@travel.save
			redirect_to joinedtravels_path()
		end
		
		
		def show
			redirect_to joinedtravels_path()
		end


		def create
			render html: 'creating new travel'
		end

		def update
			render html: 'updating a travel'
		end

		def destroy
			travel_id = params[:id]
			user_id = current_user.id
			# render html: travel_id
			@jt = Joinedtravel.where('joinedtravels.user_id == ?', user_id).where('joinedtravels.travel_id == ?', travel_id).first
			@jt.destroy
			@travel = Travel.find(travel_id)
			@travel.posti_disponibili += 1
			@travel.save

			redirect_to joinedtravels_path()
		end
end
