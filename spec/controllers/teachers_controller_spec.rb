require 'rails_helper'

RSpec.describe TeachersController, type: :controller do

	describe "GET #show" do
      it "returns http success" do
      	teacher = User.create(first_name: 'first', last_name: 'last', password: 'password', password_confirmation: 'password', email: 'test@test.com' )
		get :show, id: teacher.id
		expect(response).to have_http_status(:success)
	  end



	end


end
