class FlowLayout < Layout

	def self.default
		default = FlowLayout.new
		default.rows = 9
		default.cols = 4
		default.width = 8.5 * 72 #8.5 inches
		default.height = 11 * 72 #11 inches
		default.outside_margin = 0.5 * 72 #1/2 inch
		default.inside_margin = 9 #1/2 line height of 12pt font
		default.set_row_height
		default.set_col_width
		return default
	end

end
