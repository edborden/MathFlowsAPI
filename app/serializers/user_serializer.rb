class UserSerializer < ApplicationSerializer
	attributes :guest,:name,:pic
	has_many :folders, embed_in_root: true
	has_many :headers,embed_in_root:true, each_serializer: PositionSerializer, root: "positions"
	has_one :layout, embed_in_root: true
	has_one :group, embed_in_root: true

end
