class UserSerializer < ApplicationSerializer
	attributes :guest,:name,:pic
	has_many :folders, embed_in_root: true
end
