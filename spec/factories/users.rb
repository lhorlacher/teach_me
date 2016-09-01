FactoryGirl.define do
  factory :user do
    first_name "MyString"
    last_name "MyString"
    email Faker::Internet.email
    password "MyString"
    password_confirmation "MyString"
  end
end
