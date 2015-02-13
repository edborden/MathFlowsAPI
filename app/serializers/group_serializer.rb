class GroupSerializer < ApplicationSerializer
	attributes :name
	has_many :users, embed_in_root: true, each_serializer: GroupUserSerializer, root: 'users'

	def users
		object.users - [scope]
	end

end
