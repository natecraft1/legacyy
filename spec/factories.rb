require 'factory_girl'
FactoryGirl.define do
	sequence :email do |n|
		"person#{n}@email.com"
	end
  sequence :what_i_did do |w|
    "what i did #{w}"
  end
  sequence :id do |n|
      n
  end   
  factory :user do
    id       { generate(:id) }
    name     "Nathan Glass"	
    email    { generate(:email) }
    password "foobar"
    password_confirmation "foobar"
    date_of_birth "1967-08-26"
  end
  factory :year do
    user
  	what_i_did	"Became a developer"
  	lesson_or_story	"went to the park"
  end
end