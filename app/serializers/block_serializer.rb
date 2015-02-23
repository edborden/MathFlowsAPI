class BlockSerializer < ApplicationSerializer
	attributes :question,:content
	has_many :positions
	has_one :user
	has_many :images, embed_in_root:true
end