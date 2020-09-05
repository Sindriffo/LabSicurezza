class ModificasController < ApplicationController

	def index
	#	render html: params
		
#		redirect_to user_path(user)
	end

	def create
		current_user.update("nome" => params[:user][:nome])
		current_user.update("cognome" => params[:user][:cognome])
		current_user.save
		redirect_to user_path(current_user)
	end
end
