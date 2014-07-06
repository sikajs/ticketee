FactoryGirl.define do
  factory :user do
    name "Example user"
    email "sample@example.com"
    password "test1234"
    password_confirmation "test1234"

    factory :admin_user do
      admin true
    end
  end
end
