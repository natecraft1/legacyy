class User < ActiveRecord::Base
	validates :name, presence: true, length: {minimum: 3, maximum: 25}, allow_blank: false, uniqueness: true

	has_secure_password
	validates :password, length: { minimum: 6, maximum: 20 }

end
