class Block < ActiveRecord::Base
	has_many :positions, as: :positionable
	has_many :child_positions, class_name: "Position", as: :owner, dependent: :destroy
	has_many :positionables, through: :child_positions, source_type: "Snippet"

	def snippets
		positionables
	end

	def layout
		positions.first.owner.layout
	end

	def width
		positions.first.width
	end

	def height
		positions.first.height
	end

	def col_width
		positions.first.col_width
	end

end
