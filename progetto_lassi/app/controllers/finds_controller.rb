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
        
        ########################################### VARIABILI 
        @cpart = travel[:citta_partenza]
        @carri = travel[:citta_arrivo]
        @data = Date.new travel["data(1i)"].to_i, travel["data(2i)"].to_i, travel["data(3i)"].to_i
        ###########################################

        redirect_to finds_path(@cpart+"#"+@carri+"#"+@data.to_s)
    end



end
