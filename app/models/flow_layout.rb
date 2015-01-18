class FlowLayout < Layout

	def self.default
		default = FlowLayout.new
		default.cols = 4
		default.width = 8.5 * 72 #8.5 inches
		default.height = 11 * 72 #11 inches
		default.outside_margin = 0.5 * 72 #1/2 inch
		default.inside_margin = 9 #1/2 line height of 12pt font
		default.row_height = 18 # line height of 12pt font
		default.col_width = 128.25
		return default
	end

	def rows
		9
	end

	#def set_row_height
	#	working_space =  height_between_outside_margin - total_inside_margin_height
	#	row_height = working_space / rows
	#	self.row_height = row_height
	#end
end
