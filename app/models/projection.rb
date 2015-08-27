class Projection < ActiveRecord::Base
	
	belongs_to :table
	has_many :row_cells, dependent: :destroy, class_name: "Cell", foreign_key: "row_id", counter_cache: true
	has_many :col_cells, dependent: :destroy, class_name: "Cell", foreign_key: "col_id", counter_cache: true

	enum axis: [:row,:col]

	validates_presence_of :table_id,:axis,:position

	def cells
		row? ? row_cells : col_cells
	end

	scope :row, -> { where(axis:0) }
	scope :col, -> { where(axis:1) }

end