FactoryGirl.define do

  sequence(:email) { |n| "user#{n}@example.com" }

  factory :user do
    email "peter@gmail.com"
    password "123456"
    first_name "Peter"
    last_name "Gillian"
    admin false
  end

  factory :admin, class: User do
    email "peter2@example.com"
    password "qwertyuiop"
    admin true
    first_name "Admin"
    last_name "User"
  end

end