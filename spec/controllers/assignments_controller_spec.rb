require 'rails_helper'

RSpec.describe AssignmentsController, type: :controller do

	describe "Get #index" do
		before(:each) do
			sign_in(user = FactoryGirl.create(:user))
			@lesson = FactoryGirl.create(:lesson_with_assignments, user_id: user.id)
			@assignments = @lesson.assignments
			get :index, lesson_id: @lesson.id
		end

		it "returns http success" do
			get :index, lesson_id: @lesson.id
			expect(response).to have_http_status(:success)
		end

		it "sets the assignments index variable" do
			expect(assigns(:assignments)).to eq(@assignments)
		end

		it "returns the correct assignments in the assignments instance variable" do
			expect(Assignment.all.count).to eq(5)
		end

		it "renders the index template" do
		end
	end

end
