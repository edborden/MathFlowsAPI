class Layout < ActiveRecord::Base

	belongs_to :flow

	def self.default
		default = Layout.new
		default.cols = 4
		default.width = 8.5 * 72 #8.5 inches
		default.height = 11 * 72 #11 inches
		default.outside_margin = 0.5 * 72 #1/2 inch
		default.inside_margin = 9 #1/2 line height of 12pt font
		default.row_height = 18 # line height of 12pt font
		default.col_width = 128.25
		default.block_cols = 16
		default.block_row_height = 18
		return default
	end

	def page_rows
		9
	end

	#def set_row_height
	#	working_space =  height_between_outside_margin - total_inside_margin_height
	#	row_height = working_space / rows
	#	self.row_height = row_height
	#end

	#def set_col_width
	#	working_space =  width_between_outside_margin - total_inside_margin_width
	#	col_width = working_space / cols
	#	self.col_width = col_width
	#end

	#def height_between_outside_margin
	#	height - (outside_margin*2)
	#end

	#def total_inside_margin_height
	#	(rows-1) * inside_margin
	#end
end
