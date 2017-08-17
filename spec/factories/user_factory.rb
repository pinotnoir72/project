FactoryGirl.define do
	sequence(:email) { |n| "user#{n}@example.com" }
	
# This will guess the User class
	factory :user do
		email 
		password "YoMama"
		first_name "Nellie"
		last_name "Hern"
		admin false 
	end
	
# This will use the User class (Admin would have been guessed)
	factory :admin, class: User do
	  email 
	  password "quatermaster"
	  first_name "Admin"
	  last_name "User"
	  admin true
	end
end


