require 'rails_helper'

RSpec.describe User, type: :model do
	
  it {should validate_presence_of(:first_name)}
  it {should validate_presence_of(:last_name)}

  it {should have_many(:lessons) }

  it "returns true of user is a teacher" do
  	user = User.create(first_name: 'lonnie', last_name: 'horlacher', email: 'test@test.com', password: 'password', password_confirmation: 'password')
  	expect(user.teacher?).to eq(true)
  end

end
