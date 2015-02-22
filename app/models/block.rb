class Block < ActiveRecord::Base
	has_many :positions, dependent: :destroy
	belongs_to :user #if it's a header_block
	has_many :images

	amoeba do
		enable
		include_association :images
	end
end
