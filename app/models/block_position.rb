class BlockPosition < Position

	def layout
		try(:owner).try(:layout) || positionable.try(:user).try(:layout)
	end

	def col_width position=nil
		layout.page_col_width
	end

	def row_height
		layout.page_row_height
	end

	def inside_margin
		layout.page_inside_margin
	end

end
