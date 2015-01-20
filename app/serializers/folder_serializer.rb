class FolderSerializer < ApplicationSerializer
	attributes :name
	has_many :flows, embed_in_root: true
	has_one :user
end
