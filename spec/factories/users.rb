FactoryGirl.define do
  factory :user do
    sequence(:email)      { |n| "sneakysnek#{n}@example.com"}
    password              'password'
    password_confirmation 'password'
  end
end
