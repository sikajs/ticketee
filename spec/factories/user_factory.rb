FactoryGirl.define do
  factory :user do
    name "Example user"
    email "sample@example.com"
    password "test1234"
    password_confirmation "test1234"

    factory :admin_user do
      email "admin@example.com"
      admin true
    end
  end
end
