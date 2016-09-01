require 'rails_helper'

RSpec.describe LessonsController, type: :controller do

	describe 'GET #index' do 
		before(:each) do 
			sign_in(user = FactoryGirl.create(:user))
			lesson = FactoryGirl.create(:lesson, user_id: user.id)
			get :index, student_id: user.id
		end
		it 'returns http success' do 
			expect(response).to have_http_status(:success)
		end

		it 'sets the lessons instance variable' do 
			expect(Lesson.all.count).to eq(1)
		end

		it 'the instance variable contains lessons' do
			expect(assigns(:lessons).first.class).to eq(Lesson) 
		end

		it 'it renders the index template' do 
		end
	end

end
