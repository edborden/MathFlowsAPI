class Position < ActiveRecord::Base
	belongs_to :page
	belongs_to :block

	def layout
		page.layout
	end

	def col_width
		layout.col_width
	end

	def row_height
		layout.row_height
	end

	def inside_margin
		layout.inside_margin
	end

	def attrs_set?
		row and col
	end

	def x
		pdf_col*col_width + pdf_col*inside_margin if attrs_set?
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

	def width
		col_span * col_width + total_inside_margin_width
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
