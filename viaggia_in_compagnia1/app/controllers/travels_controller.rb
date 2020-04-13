class TravelsController < ApplicationController
	skip_before_action :verify_authenticity_token
	
	def index
		@travels = Travel.all
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
		render html: 'crating new travel'
	end

	def create
		render html: 'creating new travel'
	end

	def update

	end

	def destroy
		render html: 'deleting a travel'
	end
	
end
