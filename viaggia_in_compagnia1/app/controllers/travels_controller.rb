class TravelsController < ApplicationController

	def index
		render html: 'listing all travels'
	end

	def show
		render html: 'showing a travel'
	end

	def create
		render html: 'creating new travel'
	end

	def update
		render html: 'editing a travel'
	end

	def destroy
		render html: 'deleting a travel'
	end
	
end
