class Folder < ActiveRecord::Base
	belongs_to :user
	has_many :tests, dependent: :destroy
	has_many :students
	has_many :folders
	belongs_to :folder
end