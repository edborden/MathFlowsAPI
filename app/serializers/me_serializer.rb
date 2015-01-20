class MeSerializer < ApplicationSerializer
	attributes :name,:pic
	has_many :folders
end
