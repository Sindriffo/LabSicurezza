require 'rails_helper'

RSpec.describe "Users", type: :request do
	context 'Get index' do
	it 'return' do
	get "/travels"
	expect(response).to be_success
	end
	end

end
