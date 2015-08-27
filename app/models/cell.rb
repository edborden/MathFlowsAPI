class Cell < ActiveRecord::Base

	belongs_to :table
	belongs_to :row, class_name:"Projection", inverse_of: :row_cells
	belongs_to :col, class_name:"Projection", inverse_of: :col_cells

	validates_presence_of :table_id,:row_id,:col_id

end