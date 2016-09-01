require 'rails_helper'

RSpec.describe AssignmentsController, type: :controller do

	describe "Get #index" do
		before(:each) do
			sign_in(user = FactoryGirl.create(:user))
			@lesson = FactoryGirl.create(:lesson)
		end

		it "returns http success" do
			get :index, lesson_id: @lesson.id
			expect(response).to have_http_staths(:success)
		end

		it "sets the assignments index variable" do
		end

		it "returns the correct assignments in the assignments instance variable" do
			create_list(:assignment, 5)
			ge
		end

		it "renders the index template" do
		end
	end

end
