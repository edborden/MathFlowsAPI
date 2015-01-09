class Snippet < ActiveRecord::Base

	belongs_to :block
	has_one :equation
	has_one :image, as: :imageable

end
