class Snippet < ActiveRecord::Base
	has_one :equation
	has_one :image, as: :imageable
	has_one :position, as: :positionable

	amoeba do
		enable
		include_association :image	
	end
end
