class Folder < ActiveRecord::Base
	belongs_to :user
	has_many :tests, dependent: :destroy
	has_many :students
	has_many :folders #don't dependent: :destroy -- UI won't work in real-time
	belongs_to :folder
end