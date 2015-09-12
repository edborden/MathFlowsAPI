class Projection < ActiveRecord::Base
	
	belongs_to :table
	has_many :row_cells, dependent: :destroy, class_name: "Cell", foreign_key: "row_id"
	has_many :col_cells, dependent: :destroy, class_name: "Cell", foreign_key: "col_id"

	enum axis: [:row,:col]

	validates_presence_of :table_id,:axis,:position

	def cells
		row? ? row_cells : col_cells
	end

	scope :row, -> { where(axis:0) }
	scope :col, -> { where(axis:1) }

	def has_write_access? user
		table.block.user == user
	end
end