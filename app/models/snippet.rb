class Snippet < ActiveRecord::Base
	has_one :equation
	has_one :image, as: :imageable
	has_one :position, as: :positionable

	def width
		position.owner.col_width * position.col_span
	end

	def height
		position.owner.layout.block_row_height * position.row_span
	end

end
