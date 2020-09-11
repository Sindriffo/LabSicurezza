require 'rails_helper'

RSpec.describe User, type: :model do
   context 'validation tests' do
		it 'controlla nome' do
			user1=User.new(cognome:'Last',email: 'sample@example.com',telefono:'1234567890').save
			expect(user1).to eq(false)

		end
		it 'controlla cognome' do
			user1=User.new(nome:'First',email: 'sample@example.com',telefono:'1234567890').save
			expect(user1).to eq(false)

		end
		it 'controlla email' do
			user1=User.new(cognome:'Last',nome:'First',telefono:'1234567890').save
			expect(user1).to eq(false)
		end
		
		it 'controlla telefono' do
			user1=User.new(cognome:'Last',nome:'First',email:'sample@example.com').save
			expect(user1).to eq(false)
		end

      it 'salvataggio' do
      user=create(:user)
      expect(user).to be_valid
   end   

   it 'cambio mail' do
	user=create(:user)
	user.email='topolino@topo.it'
	expect(user.email)=='topolino@topo.it'
   end
   end

  

	
end