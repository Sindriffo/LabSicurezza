class ModificasController < ApplicationController

	def index
	#	render html: params
		
#		redirect_to user_path(user)
	end

	def create
		current_user.update("nome" => params[:user][:nome])
		current_user.update("cognome" => params[:user][:cognome])
		current_user.update("email" => params[:user][:email])
		current_user.update("telefono" => params[:user][:telefono])
		# current_user.update("image" => params[:user][:image])
		
		# File.open(params[:file]) do |f|
		# end

		current_user.save
		redirect_to user_path(current_user)
	end

	def update
		current_user.update("nome" => params[:user][:nome])
		current_user.update("cognome" => params[:user][:cognome])
		current_user.update("email" => params[:user][:email])
		current_user.update("telefono" => params[:user][:telefono])
		current_user.save
		# redirect_to user_path(current_user)
	end


end
