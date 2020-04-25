class MyTravelsController < ApplicationController

	skip_before_action :verify_authenticity_token
	
		def index
			@my_travels = MyTravel.all
		end

		def show
			id = params[:id]
			if MyTravel.exists?(id)
				@my_travel = MyTravel.find(id)
			else
				render html: 'Travel does not exist'
			end
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
