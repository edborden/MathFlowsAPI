class Equation < ActiveRecord::Base

	belongs_to :snippet
	has_one :image, as: :imageable

end
