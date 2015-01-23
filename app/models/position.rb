class Position < ActiveRecord::Base
	belongs_to :owner, polymorphic:true
	belongs_to :positionable, polymorphic:true, dependent: :destroy

	def create_block params=nil
		block = Block.create params
		block.position = self
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
			owner.col_width
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

end
