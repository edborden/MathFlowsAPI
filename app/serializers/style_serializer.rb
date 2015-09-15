class StyleSerializer < ApplicationSerializer
	attributes :effect
	has_one :line
end
