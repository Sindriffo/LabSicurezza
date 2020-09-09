require 'rails_helper'

RSpec.describe Travel, type: :model do
  describe "creation and modification" do
    before do 
      @u=User.new(:email => 'prova@example.com',:nome =>'Gio',:cognome => 'Orl',:password => "Ciaociao2." )
      
  end
  
    it "user is valid with valid attributes" do
      expect(@u).to be_valid
    end

   
    

	it "travel is valid with valid attributes" do
      expect(@t).to be_valid
    	end
    it "cambio posti disponibili" do
      @t.posti_disponibili='1'
      expect(@t.posti_disponibili)=='1'
    end

end 
end
