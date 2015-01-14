class BlockLayout < Layout

	def self.default width,height
		default = BlockLayout.new
		default.cols = 16
		default.row_height = 18
		default.width = width
		default.height = height
		default.outside_margin = 0
		default.inside_margin = 0
		default.set_rows
		default.set_col_width
		return default
	end

	def set_rows
		rows = height_between_outside_margin / row_height
		self.rows = rows
	end

end
