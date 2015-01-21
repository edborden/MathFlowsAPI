class MeSerializer < ApplicationSerializer
	attributes :name,:pic
	has_many :folders, embed_in_root: true
end
