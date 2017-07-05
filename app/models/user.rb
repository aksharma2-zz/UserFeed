class User < ApplicationRecord
	validates :username, presence: true
	validates :name, presence:true
	has_many :posts
end
