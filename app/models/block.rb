class Block < ActiveRecord::Base
	belongs_to :test
	belongs_to :page
	belongs_to :user #if it's a header
	has_one :image, dependent: :destroy

	amoeba do
		enable
	end

	def attrs_set?
		row and col
	end

	def x
		pdf_col*COL_WIDTH + pdf_col*INSIDE_MARGIN if attrs_set?
	end

	def y
		pdf_row*ROW_HEIGHT + pdf_row*INSIDE_MARGIN if attrs_set?
	end

	def pdf_row
		row - 1 if attrs_set?
	end

	def pdf_col
		col - 1 if attrs_set?
	end

	def width
		col_span * COL_WIDTH + total_inside_margin_width
	end

	def height
		row_span * ROW_HEIGHT + total_inside_margin_height
	end

	def total_inside_margin_height
		(row_span-1) * INSIDE_MARGIN
	end

	def total_inside_margin_width
		(col_span-1) * INSIDE_MARGIN
	end

end
