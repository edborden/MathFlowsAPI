class FolderSerializer < ApplicationSerializer
	attributes :name,:open,:test_folder,:student_folder
	has_many :tests, embed_in_root: true
	has_many :students, embed_in_root: true
	has_one :user
	has_many :folders
	has_one :folder
end