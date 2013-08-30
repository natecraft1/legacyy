require 'factory_girl'


FactoryGirl.define do
  factory :user do
    name     "Nathan Glass"
    email    "user@example.com"
    password "foobar"
    password_confirmation "foobar"
    date_of_birth "1967-08-26"
  end
end