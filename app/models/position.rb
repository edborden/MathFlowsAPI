class Position < ActiveRecord::Base
	belongs_to :owner, polymorphic:true
	belongs_to :positionable, polymorphic:true, dependent: :destroy

	def create_block params=nil
		block = Block.create params
		block.positions<<self
	end

	def create_snippet params=nil
		snippet = Snippet.create params
		snippet.position = self
	end

	def page_position?
		true if owner_type == "Page"
	end

	def col_width
		if page_position?
			owner.layout.col_width
		else
			width / layout.block_cols
		end
	end

	def row_height
		if page_position?
			owner.layout.row_height
		else
			owner.layout.block_row_height
		end
	end

	def inside_margin
		if page_position?
			owner.layout.inside_margin
		else
			0
		end
	end

	def x
		pdf_col*col_width + pdf_col*inside_margin
	end

	def y
		pdf_row*row_height + pdf_row*inside_margin
	end

	def pdf_row
		row - 1
	end

	def pdf_col
		col - 1
	end

	def layout
		owner.layout
	end

	def width
		col_span * layout.col_width + total_inside_margin_width
	end

	def height
		row_span * layout.row_height + total_inside_margin_height
	end

	def total_inside_margin_height
		(row_span-1) * layout.inside_margin
	end

	def total_inside_margin_width
		(col_span-1) * layout.inside_margin
	end

end
