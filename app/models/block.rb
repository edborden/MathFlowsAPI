class Block < ActiveRecord::Base
	has_many :positions, dependent: :destroy
	has_many :images

	amoeba do
		enable
		include_association :images
	end
end
