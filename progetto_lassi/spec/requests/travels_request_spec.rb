require 'rails_helper'

RSpec.describe "Travels", type: :request do
	
	    it 'controlla id' do
      travel=create(:travel)
      travel.user_id=nil
			expect(travel).to_not be_valid
		end
    it 'controlla partenza' do
			travel1=Travel.new(user_id:0,arrivo:'Padova',prezzo:15,data:"4/12/2020",ora_partenza:"10:00",posti_disponibili:3).save
			expect(travel1).to eq(false)

    end
    it 'controlla arrivo' do
			travel1=Travel.new(user_id:0,partenza: 'Roma',prezzo:15,data:"4/12/2020",ora_partenza:"10:00",posti_disponibili:3).save
			expect(travel1).to eq(false)

    end
    it 'controlla prezzo' do
			travel1=Travel.new(user_id:0,partenza: 'Roma',arrivo:'Padova',data:"4/12/2020",ora_partenza:"10:00",posti_disponibili:3).save
			expect(travel1).to eq(false)

    end
    it 'controlla data' do
			travel1=Travel.new(user_id:0,partenza: 'Roma',arrivo:'Padova',prezzo:15,ora_partenza:"10:00",posti_disponibili:3).save
			expect(travel1).to eq(false)

    end
    it 'controlla ora' do
			travel1=Travel.new(user_id:0,partenza: 'Roma',arrivo:'Padova',prezzo:15,data:"4/12/2020",posti_disponibili:3).save
			expect(travel1).to eq(false)

    end
    it 'controlla post' do
			travel1=Travel.new(user_id:0,partenza: 'Roma',arrivo:'Padova',prezzo:15,data:"4/12/2020",ora_partenza:"10:00",).save
			expect(travel1).to eq(false)

		end
		end
