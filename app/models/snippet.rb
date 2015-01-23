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

	def formatted_question_number page
		question_number = position.owner.question_number page
		formatted = question_number.to_s + "."
	end
end
