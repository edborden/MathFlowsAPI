class Cell < ActiveRecord::Base

	belongs_to :table
	belongs_to :row, class_name:"Projection", inverse_of: :row_cells
	belongs_to :col, class_name:"Projection", inverse_of: :col_cells
	has_many :lines, -> { order(:position) }, as: :lineable, dependent: :destroy

	validates_presence_of :table_id,:row_id,:col_id

	def user
		table.block.user
	end

	def has_write_access? user
		self.user == user
	end

end