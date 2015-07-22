class PreferenceSerializer < ApplicationSerializer
	attributes :directions,:borders
	has_one :user
end
