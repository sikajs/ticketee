FactoryGirl.define do
  sequence(:email) {|n| "user#{n}@example.com"}

  factory :user do
    name "username"
    email { generate(:email) }
    password "test1234"
    password_confirmation "test1234"

    factory :admin_user do
      #email "admin@example.com"
      admin true
    end
  end
end
