FactoryGirl.define do
  sequence(:email) { |n| "user#{n}@example.com" }

  factory :user do
    email
    password "yoiiii"
    first_name "Bob"
    last_name "Duncan"
    admin false
  end

  factory :admin, class: User do
   email
   password "hiiiii"
  end
end


