class MeSerializer < ApplicationSerializer
	attributes :name
	has_many :grids, embed_in_root: true
end
