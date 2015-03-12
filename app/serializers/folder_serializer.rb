class FolderSerializer < ApplicationSerializer
	attributes :name,:open,:flow_folder,:student_folder
	has_many :flows, embed_in_root: true
	has_many :students, embed_in_root: true
	has_one :user
	has_many :folders
	has_one :folder
end
