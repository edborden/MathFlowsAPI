class Layout < ActiveRecord::Base

	def set_row_height
		working_space =  height_between_outside_margin - total_inside_margin_height
		row_height = working_space / rows
		self.row_height = row_height
	end

	def set_col_width
		working_space =  width_between_outside_margin - total_inside_margin_width
		col_width = working_space / cols
		self.col_width = col_width
	end

	def width_between_outside_margin
		width - (outside_margin*2)
	end

	def height_between_outside_margin
		height - (outside_margin*2)
	end

	def total_inside_margin_width
		(cols-1) * 2 * inside_margin
	end

	def total_inside_margin_height
		(rows-1) * 2 * inside_margin
	end
end
