FactoryGirl.define do
  sequence(:email) { |n| "user#{n}@example.com"}

  factory :user do
    email
    password "password"
    password_confirmation { password }
  end

  factory :course do
    description "Description"
    title "Course Name"
  end
end
