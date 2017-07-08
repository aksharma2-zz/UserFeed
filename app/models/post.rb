class Post < ApplicationRecord
	validates :heading, presence: true
	validates :user_id, presence: true
	belongs_to :user, required: true
end
