class TravelsController < ApplicationController

		before_action :authenticate_user!

	def index
		id = params[:format]
		if id != nil
			redirect_to travels_path()
		end

		id = current_user.id
		if User.exists?(id)
			@user = User.find(id)

			#All travels created from other users
			@other_user_travels = Travel.where('travels.user_id != ?', @user.id).where('travels.data >= ?', DateTime.now)

			#All travels the user joined
			@joined_travels = Travel.joins(:joinedtravels).where('joinedtravels.user_id == ?', @user.id)


			@travels = []
			@other_user_travels.each do |travel|
				if !(@joined_travels.include? travel)
					@travels << travel
				end
			end

			#Future NOT joined travels
			# @future_travels = Travel.where('travels.user_id != ?', @user.id).where('travels.data >= ?', DateTime.now)
			# @travels = @future_travels.left_joins(:joinedtravels).where('joinedtravels.user_id != ? OR joinedtravels.user_id is null', @user.id)
		end
	end

	def show
		id = params[:id]
		if Travel.exists?(id)
			@travel = Travel.find(id)
		else
			render html: 'Travel does not exit'
		end
	end

	def new
		@travel = Travel.new
	end

	def create
		@travel = Travel.new(params[:travel].permit!)
		@travel.user_id = session[:user_id]
		if @travel.save
            flash[:notice] = "Travel was added" #"Movie #{@movie.title} was added"
            redirect_to users_path
        else
            flash[:notice] = @travel.errors.full_messages
            redirect_to users_path
        end
	end

	def update

	end

	def destroy
		id = params[:id]
		@travel = Travel.find(id)
		@travel.destroy
        flash[:notice] = "Travel deleted."
		redirect_to user_joinedtravels_path(User.find(session[:user_id]))
	end
end
