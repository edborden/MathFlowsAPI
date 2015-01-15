class Snippet < ActiveRecord::Base
	has_one :equation
	has_one :image, as: :imageable
	has_one :position, as: :positionable

	def self.create_default position
		snippet = Snippet.new
		snippet.position = position
		snippet.save
		return snippet
	end

	def width
		position.owner.layout.col_width * position.col_span
	end

	def height
		position.owner.layout.row_height * position.row_span
	end
end
