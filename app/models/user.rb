class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
  before_create :create_remember_token
	validates :name, presence: true, length: {minimum: 3, maximum: 25}, allow_blank: false, uniqueness: true
  validates_format_of :name, :with => /^[^0-9`!@#\$%\^&*+_=]+$/, :multiline => true
	validates :email, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

	has_secure_password
	validates :password, length: { minimum: 6, maximum: 20 }
	validates :password, :confirmation => true

	def User.new_remember_token
		puts " puts user.new_remember_token called"
		SecureRandom.urlsafe_base64
	end

	def User.encrypt(token)
		puts "puts user.encrypt called with #{token}"
    Digest::SHA1.hexdigest(token.to_s)
	end

	private
		def create_remember_token
			puts " puts remember_token_created for #{self}"
			puts self
			self.remember_token = User.encrypt(User.new_remember_token)
		end

end
