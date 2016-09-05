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
			expect(response).to have_http_status(:success)
		end

		it "sets the lesson instance variable" do
			expect(assigns(:lesson)).to eq(@lesson)
		end 

		it "sets the assignments instance variable" do
			expect(assigns(:assignments)).to eq(@assignments)
		end

		it "returns the correct assignments in the assignments instance variable" do
			expect(Assignment.all.count).to eq(5)
		end

		it "sets the student instance variable" do
			expect(assigns(:student)).to eq(User.find(@lesson.user_id))
		end

		it "renders the index template" do
			expect(response).to render_template(:index)
		end
	end


	describe "GET #new" do
		before(:each) do
			sign_in(user = FactoryGirl.create(:user))
			@lesson = FactoryGirl.create(:lesson_with_assignments, user_id: user.id)
			get :new, lesson_id: @lesson.id
		end

		it "returns http success" do
			expect(response).to have_http_status(:success)
		end

		it "sets the assignment instance variable to a new instance of an assignment" do
			expect(assigns(:assignment).class).to eq(Assignment)
		end

		it "renders the new template" do
			expect(response).to render_template(:new)
		end
	end

	describe "GET #edit" do
		before(:each) do
			sign_in(user = FactoryGirl.create(:user))
			@lesson = FactoryGirl.create(:lesson_with_assignments, user_id: user.id)
			@assignment = @lesson.assignments.first
			get :edit, id: @assignment.id
		end

		it "sets returns http success" do
			expect(response).to have_http_status(:success)
		end

		it "sets the assignment instance variable" do
			expect(assigns(:assignment).class).to eq(Assignment)
		end

		it "returns the correct value for the instance variable" do
			expect(assigns(:assignment)).to eq(@assignment)
		end

		it "renders the edit view" do
			expect(response).to render_template(:edit)
		end
	end

	describe "POST #create" do
		context "requires good params" do
			before(:each) do
				sign_in(user = FactoryGirl.create(:user))
				@lesson = FactoryGirl.create(:lesson_with_assignments, user_id: user.id)
				assignment_params = {book: 'test', page: 23, days_per_week: 5}
				@assignment = @lesson.assignments.new(assignment_params)
				post :create, lesson_id: @lesson.id, assignment: assignment_params
			end

			it "sets the lesson instance variable" do
				expect(assigns(:lesson)).to eq(@lesson)
			end

			it "sets the assignment instance variable" do
				expect(assigns(:assignment).class).to eq(Assignment)
			end

			it "creates an assignment successfully" do
				expect(Assignment.all.count).to eq(6)
			end

			it "renders the assignment index on successful create" do
				expect(response).to redirect_to(assignments_path(@lesson))
			end
		end

		context "requires bad params" do
			before(:each) do
				sign_in(user = FactoryGirl.create(:user))
				@lesson = FactoryGirl.create(:lesson_with_assignments, user_id: user.id)
				assignment_params = {book: '', page: 23, days_per_week: 5}
				@assignment = @lesson.assignments.new(assignment_params)
				post :create, lesson_id: @lesson.id, assignment: assignment_params
			end

			it "renders the edit page of failed create" do
				expect(response).to render_template(:new)
			end
		end
	end

	describe "PUT #update" do
		context "requires good params" do
			before(:each) do
				sign_in(user = FactoryGirl.create(:user))
				@lesson = FactoryGirl.create(:lesson_with_assignments, user_id: user.id)
				assignment_params = {book: 'updated'}
				@assignment = @lesson.assignments.first
				put :update, { id: @assignment.id, assignment: assignment_params }
			end

			it "sets the assignment instance variable" do
				expect(assigns(:assignment)).to eq(@assignment)
			end

			it "successfully updates the assignment" do
				expect(@assignment.reload.book).to eq('updated')
			end

			it "redirects to the assignment index on successfully update" do
				expect(response).to redirect_to(assignments_path(@assignment.lesson_id))
			end
		end

		context "requires bad params" do
			before(:each) do
				sign_in(user = FactoryGirl.create(:user))
				@lesson = FactoryGirl.create(:lesson_with_assignments, user_id: user.id)
				assignment_params = {book: ''}
				@assignment = @lesson.assignments.first
				put :update, { id: @assignment.id, assignment: assignment_params }
			end

			it "renders the edit template on failed update" do
				expect(response).to render_template(:edit)
			end
		end
	end

	describe "DELETE #destroy" do
		before(:each) do
			sign_in(user = FactoryGirl.create(:user))
			@lesson = FactoryGirl.create(:lesson_with_assignments, user_id: user.id)
			@assignment = @lesson.assignments.first
			delete :destroy, id: @assignment.id
		end

		it "sets the assignment instance variable" do
			expect(assigns(:assignment)).to eq(@assignment)
		end

		it "destroys the assignment" do
			expect(Assignment.all.count).to eq(4)
		end

		it "redirects to the assignments index" do
			expect(response).to redirect_to(assignments_path(@assignment.lesson_id))
		end
	end

	describe "GET #practice" do
		before(:each) do
			sign_in(user = FactoryGirl.create(:user))
			@lesson = FactoryGirl.create(:lesson_with_assignments, user_id: user.id)
			@assignments = @lesson.assignments
			get :practice, lesson_id: @lesson.id
		end

		it "returns http success" do
			expect(response).to have_http_status(:success)
		end

		it "sets the assignments instance variable" do
			expect(assigns(:assignments).count).to eq(5)
		end

		it "renders the practice template" do
			expect(response).to render_template(:practice)
		end
	end
end
