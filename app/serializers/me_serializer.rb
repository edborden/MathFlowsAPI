class MeSerializer < ApplicationSerializer
	attributes :name
	has_many :layouts, embed_in_root: true
end
