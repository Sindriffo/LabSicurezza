class UsersController < ApplicationController

	before_action :authenticate_user!

	def index
		@users = User.where("users.id != ?", current_user.id)
	end

	def show
		id = params[:id]
		@user = User.find(id)
	end	

	def destroy
		id = params[:id]
		@user = User.find(id)

		@all_joined_travels = Joinedtravel.where('joinedtravels.user_id == ?', id)
		@all_joined_travels.each do |jt|
			jt.destroy
		end

		@all_created_travels = Travel.where('travels.user_id == ?', id)
		@all_created_travels.each do |ct|
			@all_joined_travels = Joinedtravel.where('joinedtravels.travel_id == ?', ct.id)
			@all_joined_travels.each do |jt|
				jt.destroy
			end
			
			ct.destroy
		end

		@user.destroy
        flash[:notice] = "User deleted."
		redirect_to users_path
	end

	def update
		id = params[:id]
		@user = User.find(id)

		if @user.sospeso?
			@user.sospeso = false
		else
			@user.sospeso = true
		end
		@user.save

		redirect_to users_path
	end

	def edit
		id = params[:id]
		@user = User.find(id)

		if @user.admin?
			@user.admin = false
		else
			@user.admin = true
		end

		@user.save
		redirect_to users_path
	end
end
