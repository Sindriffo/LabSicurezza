require 'rails_helper'

RSpec.describe "Users", type: :request do

    context 'controlli users' do
        it "creation user" do

    user = create(:user)
    expect(user.admin).to be_falsey
    end

    it "creation super_user" do

        user = create(:user)
        expect(user.super_admin).to be_falsey
        end
        
    
    it "sospensione" do
        user =create(:user)
        user.sospeso=true
        user.rating=1
        expect(user.sospeso).to eq(true)
        end

        it 'password'do
        user = create(:user)
        user.password='Ciao'
        expect(user).to_not be_valid
    end
end
end
        
