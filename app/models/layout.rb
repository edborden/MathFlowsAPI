class Layout < ActiveRecord::Base

	belongs_to :layoutable, polymorphic:true

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
