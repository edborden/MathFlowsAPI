class Block < ActiveRecord::Base
	has_one :position, as: :positionable
	has_many :child_positions, class_name: "Position", as: :owner, dependent: :destroy
	has_many :positionables, through: :child_positions, source_type: "Snippet"

	after_create do
		position = Position.create
		child_positions<<position
		position.create_snippet
	end

	def layout
		position.owner.layout
	end

	def width
		position.col_span * layout.col_width + total_inside_margin_width
	end

	def height
		position.row_span * layout.row_height + total_inside_margin_height
	end

	def total_inside_margin_height
		(position.row_span-1) * layout.inside_margin
	end

	def total_inside_margin_width
		(position.col_span-1) * layout.inside_margin
	end

	def col_width
		width / layout.block_cols
	end

end
