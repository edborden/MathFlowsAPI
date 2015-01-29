class Position < ActiveRecord::Base
	belongs_to :owner, polymorphic:true
	belongs_to :positionable, polymorphic:true

	# inheritors need to define
	## inside_margin
	## col_width
	## row_height

	def attrs_set?
		row and col
	end

	def x position=nil
		pdf_col*col_width(position) + pdf_col*inside_margin if attrs_set?
	end

	def y
		pdf_row*row_height + pdf_row*inside_margin if attrs_set?
	end

	def pdf_row
		row - 1 if attrs_set?
	end

	def pdf_col
		col - 1 if attrs_set?
	end

	def width position=nil
		col_span * col_width(position) + total_inside_margin_width
	end

	def height
		row_span * row_height + total_inside_margin_height
	end

	def total_inside_margin_height
		(row_span-1) * inside_margin
	end

	def total_inside_margin_width
		(col_span-1) * inside_margin
	end

end
