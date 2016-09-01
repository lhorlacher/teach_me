require 'rails_helper'
require 'faker'

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
			expect(response).to render_template(:index)
		end
	end

	describe 'GET #new' do 
		before(:each) do
			sign_in(user = FactoryGirl.create(:user))
			get :new, student_id: user.id
		end

		it 'returns http success' do 
			expect(response).to have_http_status(:success)
		end

		it 'sets the lesson instance variable' do 
			expect(assigns(:lesson).class).to eq(Lesson)
		end

		it 'renders the new template' do 
			expect(response).to render_template(:new)
		end
	end

	describe 'POST #create' do 
		before(:each) do 
			sign_in(teacher = FactoryGirl.create(:user))
			student = FactoryGirl.create(:user)
			lesson_params = {lesson_date: Faker::Date.between(1.month.ago, Date.today),
			                 notes: 'these are notes', feedback: 'This is feedback'}
			post :create, {student_id: student.id, lesson: lesson_params}
		end

		it 'returns http success' do 
			expect(response).to have_http_status(:success)
		end
	end
end
