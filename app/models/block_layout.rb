class BlockLayout < Layout

	def self.default
		default = BlockLayout.new
		default.cols = 16
		default.row_height = 18
		default.outside_margin = 0
		default.inside_margin = 0
		return default
	end

	def height
		layoutable.position.row_span * page_layout.row_height + total_inside_margin_height
	end

	def total_inside_margin_height
		(layoutable.position.row_span-1) * page_layout.inside_margin
	end

	def total_inside_margin_width
		(layoutable.position.col_span-1) * page_layout.inside_margin
	end

	def page_layout
		layoutable.position.owner.layout
	end

	def width
		layoutable.position.col_span * page_layout.col_width + total_inside_margin_width
	end

	def col_width
		working_space =  width_between_outside_margin - total_inside_margin_width
		col_width = working_space / cols
	end

	def width_between_outside_margin
		width - (outside_margin*2)
	end

	def total_inside_margin_width
		(cols-1) * inside_margin
	end

end
