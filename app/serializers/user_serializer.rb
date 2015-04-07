class UserSerializer < ApplicationSerializer
	attributes :guest,:name,:pic,:premium
	has_many :folders, embed_in_root: true
	has_many :blocks,embed_in_root:true
	#has_one :group, embed_in_root: true
end
