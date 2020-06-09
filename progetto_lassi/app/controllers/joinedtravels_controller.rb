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
				@past_travels = Travel.where('travels.data < ?', DateTime.now)
				@future_travels = Travel.where('travels.data >= ?', DateTime.now)
				
				@past_joinedtravels = @past_travels.joins(:joinedtravels).where('joinedtravels.user_id == ?', @user.id)
				@future_joinedtravels = @future_travels.joins(:joinedtravels).where('joinedtravels.user_id == ?', id)
				
		
				@created_travels = Travel.where('travels.user_id == ?', id)
	
			else
				render html: 'Error! User does not exit'
			end
		end

		def new
			id = params[:user_id]
			user_id = session[:user_id]
			@jt = Joinedtravel.new(:user_id => user_id, :travel_id => id)
			@jt.save
			redirect_to travels_path()
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
			render html: 'deleting a travel'
		end
end
