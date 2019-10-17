FactoryBot.define do
  
	sequence(:email) { |n| 'user#{n}@example.com' }
	
  factory :user do
    email 
    password {"Password"}
    first_name {"Nelda"}
    last_name {"Hernandez"}
    admin {false}
  end

  factory :admin, class: User do
	  email 
	  password {"Password"}
	  admin {true}
	  first_name {"Admin"}
	  last_name {"User"}
	end
end