class Cell < ActiveRecord::Base
	include ProcessedContent

	belongs_to :table
	belongs_to :row, class_name:"Projection", inverse_of: :row_cells
	belongs_to :col, class_name:"Projection", inverse_of: :col_cells

	validates_presence_of :table_id,:row_id,:col_id

	after_save {table.block.run_invalidator}

	def has_write_access? user
		table.block.user == user
	end

end