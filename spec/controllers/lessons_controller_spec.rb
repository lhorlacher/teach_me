require 'rails_helper'

RSpec.describe LessonsController, type: :controller do

	describe 'GET #index' do 
		before(:each) do 
			sign_in(user = FactoryGirl.create(:user))
			
			get :index, student_id: user.id
		end
		it 'returns http success' do 
			expect(response).to have_http_status(:success)
		end
	end

end
