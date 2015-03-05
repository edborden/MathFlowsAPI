class BlockSerializer < ApplicationSerializer
	attributes :question,:content
	has_many :positions
	has_one :image, embed_in_root:true
end