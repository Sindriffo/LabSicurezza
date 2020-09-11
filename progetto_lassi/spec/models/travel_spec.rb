require 'rails_helper'

RSpec.describe Travel, type: :model do
  context 'validation travel_test' do


        
    it "cambio posti" do
      travel=create(:travel)
      travel.posti_disponibili=(travel.posti_disponibili)-2
      expect(travel.posti_disponibili)==1

  end
  it "valid travel" do
    travel=create(:travel)
   expect(travel).to be_valid
 end



end

  

end
