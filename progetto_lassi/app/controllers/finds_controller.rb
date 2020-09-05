class FindsController < ApplicationController


    def index
        @var = params[:format].split("#")
        @cpart = @var[0]
        @carri = @var[1]
        @data = @var[2].to_date

        @travels = Travel.where('travels.data == ?', @data).where("travels.partenza LIKE lower(?)", @cpart)       
    end
    
    
    def create
        travel = params[:travel]
        
        @var = travel[:citta_partenza]

		@client = OpenStreetMap::Client.new
		@partenza = @client.search(q: @var, format: 'json', addressdetails: '1', accept_language: 'it')
        @area = @client.reverse(format: 'json', lat: @partenza[0]['lat'], lon: @partenza[0]['lon'], accept_language: 'it')

        render html: @area['address']["city"]

        ########################################### VARIABILI 
        @cpart = travel[:citta_partenza]
        @carri = travel[:citta_arrivo]
        @data = Date.new travel["data(1i)"].to_i, travel["data(2i)"].to_i, travel["data(3i)"].to_i
        ###########################################

        # redirect_to finds_path(@cpart+"#"+@carri+"#"+@data.to_s)
    end



end
