class FolderSerializer < ApplicationSerializer
	attributes :name,:open,:test_folder,:student_folder
	has_many :tests, embed: :ids, include: :true
	has_many :students, embed: :ids, include: :true
	has_one :user
	has_many :folders
	has_one :folder
end