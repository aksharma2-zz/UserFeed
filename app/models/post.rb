class Post < ApplicationRecord
	validates :heading, presence: true
	belongs_to :user, required: true
end
