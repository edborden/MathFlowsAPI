class GuestUserSerializer < ApplicationSerializer
	attributes :guest
	has_many :flows, embed_in_root: true
end
