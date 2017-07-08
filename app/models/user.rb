class User < ApplicationRecord
	attr_accessor :id
	before_save :downcase_email
	validates :username, presence: true, uniqueness: { case_sensitive: false }
	validates :name, presence: true
	validates :password, presence: true
	has_many :posts
	has_secure_password
	
	# @user = User.new(name: "Example User", email: "user@example.com",  password: "foobar", password_confirmation: "foobar")
	def downcase_email
		self.email = email.downcase
	end

end
