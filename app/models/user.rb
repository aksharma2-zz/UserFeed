class User < ApplicationRecord
	validates :username, presence: true, uniqueness: { case_sensitive: false }
	validates :name, presence: true
	has_secure_password
	
	# @user = User.new(name: "Example User", email: "user@example.com",  password: "foobar", password_confirmation: "foobar")
end
