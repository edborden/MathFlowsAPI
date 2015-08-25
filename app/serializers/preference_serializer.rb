class PreferenceSerializer < ApplicationSerializer
	attributes :directions,:borders,:tour
	has_one :user
end
