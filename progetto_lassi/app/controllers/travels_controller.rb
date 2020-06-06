class TravelsController < ApplicationController

		before_action :authenticate_user!

	def index
		@travels = Travel.all
	end
	
	def show
		id = params[:id]
		@travel = Travel.find(id)
	end
	
	def new
		#default rendering
	end
	
	def create
		@travel = Travel.create!(params[:travel].permit(:citta_partenza, :citta_arrivo, :data, :ora_partenza, :ora_arrivo,
		:via_partenza, :via_arrivo, :prezzo, :posti_disponibili))
		# authorize! :create, @travel, :message => "BEWARE: You are not authorized to create new travels."
		flash[:notice] = "#{@travel} was successfully created."
		redirect_to travels_path
	end
	
	def edit
		id = params[:id]
		@travel = Travel.find(id)
		authorize! :update, @travel
	end
	
	def update
		id = params[:id]
		@travel = Travel.find(id)
		authorize! :update, @travel, :message => "BEWARE: You are not authorized to update a travel."
		@travel.update_attributes!(params[:travel].permit(:citta_partenza, :citta_arrivo, :data, :ora_partenza, :ora_arrivo,
		:via_partenza, :via_arrivo, :prezzo, :posti_disponibili))
		flash[:notice] = "#{@travel} was successfully updated."
		redirect_to travel_path(@travel)
	end
	
	def destroy
		id = params[:id]
		@travel = Travel.find(id)
		authorize! :destroy, @travel, :message => "BEWARE: You are not authorized to delete travels."
		@travel.destroy
		flash[:notice] = "#{@travel} has been deleted."
		redirect_to travels_path
	end
end
