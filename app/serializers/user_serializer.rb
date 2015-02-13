class UserSerializer < ApplicationSerializer
	attributes :guest,:name,:pic
	has_many :folders, embed_in_root: true
	has_one :header
	has_one :header_position,embed_in_root:true,serializer:PositionSerializer,root:"position"
	has_one :layout, embed_in_root: true
	has_one :group, embed_in_root: true

	def header_position
		object.header.positions.first
	end

end
