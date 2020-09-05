class FindsController < ApplicationController


    def index
        @var = params[:format].split("#")
        @cpart = @var[0]
        @carri = @var[1]
        @data = @var[2]

        @travels = Travel.all       

        if @data != nil
            @travels = @travels.where('travels.data == ?', @data.to_date)
        end

        if @cpart != ""
            @travels = @travels.where("travels.area_partenza == ?", @cpart)
        end

        if @carri != ""
            @travels = @travels.where("travels.area_arrivo == ?", @carri)
        end
    end
    
    
    def create
        travel = params[:travel]
        @cpart = ""
        @carri = ""
        

        @part_query = travel[:partenza]
        @arri_query = travel[:arrivo]

		@client = OpenStreetMap::Client.new

        if @part_query != ""
            @partenza = @client.search(q: @part_query, format: 'json', accept_language: 'it')
            @address = @client.reverse(format: 'json', lat: @partenza[0]['lat'], lon: @partenza[0]['lon'], accept_language: 'it')['address']

            if @address['county'] != nil
                @cpart = @address['county'].to_s
            else 
                @cpart = @address['city'].to_s
            end
        end
        
        if @arri_query != ""
            @partenza = @client.search(q: @arri_query, format: 'json', accept_language: 'it')
            @address = @client.reverse(format: 'json', lat: @partenza[0]['lat'], lon: @partenza[0]['lon'], accept_language: 'it')['address']

            if @address['county'] != nil
                @carri = @address['county'].to_s
            else 
                @carri = @address['city'].to_s
            end
        end

        # render html: travel
        @data = ""
        if travel['data'] != ""
            @data = travel['data'].to_date
        end

        redirect_to finds_path(@cpart+"#"+@carri+"#"+@data.to_s)
    end



end
