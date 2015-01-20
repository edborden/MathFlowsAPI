class GuestUserSerializer < ApplicationSerializer
	attributes :guest
	has_many :folders, embed_in_root: true
end
