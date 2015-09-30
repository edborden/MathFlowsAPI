class TableCopy
	attr_accessor :table

	def initialize original_table,block

		@table = original_table.amoeba_dup
		@table.block = block
		@table.save
		original_table.cells.each do |cell|
			row_position = cell.row.position
			col_position = cell.col.position
			new_row = @table.rows.where(position:row_position).take
			new_col = @table.cols.where(position:col_position).take

			new_cell = cell.amoeba_dup
			new_row.row_cells<<new_cell
			new_col.col_cells<<new_cell
			@table.cells<<new_cell
			new_cell.save
		end
	end

end