class Position < ActiveRecord::Base
	belongs_to :owner, polymorphic:true
	belongs_to :positionable, polymorphic:true, dependent: :destroy

	def self.create_default source
		position = Position.new
		if source.is_a? Page
			position.save
			Block.create_default position
		end
		if source.is_a? Block
			position.row = 1
			position.col = 1
			position.save
			Snippet.create_default position
		end
		return position
	end

	def x
		pdf_col*owner.layout.col_width + pdf_col*owner.layout.inside_margin
	end

	def y
		pdf_row*owner.layout.row_height + pdf_row*owner.layout.inside_margin
	end

	def pdf_row
		row - 1
	end

	def pdf_col
		col - 1
	end

end
