class MeSerializer < ApplicationSerializer
	attributes :name,:pic
	has_many :flows
end
