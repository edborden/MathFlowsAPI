class Block < ActiveRecord::Base
	has_many :positions, dependent: :destroy
	has_one :image, dependent: :destroy

	amoeba do
		enable
		include_association :image
	end
end
