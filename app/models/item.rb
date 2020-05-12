class Item < ApplicationRecord
	belongs_to :user
	belongs_to :category
	has_many :comments, dependent: :destroy
	validates :title, presence: true
	
end
