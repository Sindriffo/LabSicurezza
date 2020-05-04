class TravelsController < ApplicationController
	# skip_before_action :verify_authenticity_token
	
	def index
		id = params[:format]
		if id != nil
			redirect_to travels_path()
		end

		id = session[:user_id]
		if User.exists?(id)
			@user = User.find(id)
			@travels = Travel.where('travels.user_id != ?', @user.id)
		else
			render html: 'Error! Unknown User'
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
		redirect_to user_joinedtravels_path(User.find(session[:user_id]))
	end
	
end
