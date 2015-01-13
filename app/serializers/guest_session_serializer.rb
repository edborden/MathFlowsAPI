class GuestSessionSerializer < ApplicationSerializer
	attributes :token
	has_one :user, embed_in_root: true, serializer: GuestUserSerializer, root: 'user'
end
