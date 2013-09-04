require 'factory_girl'
FactoryGirl.define do
	sequence :email do |n|
		"person#{n}@email.com"
	end
  factory :user do
    name     "Nathan Glass"	
    email    { generate(:email) }
    password "foobar"
    password_confirmation "foobar"
    date_of_birth "1967-08-26"
  end
  factory :year do
  	what_i_did	"Became a developer"
  	lesson_or_story	"went to the park"
  	user
  end
end