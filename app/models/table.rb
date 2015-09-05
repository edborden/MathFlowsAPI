class Table < ActiveRecord::Base

	belongs_to :block
	has_many :projections, dependent: :destroy
	has_many :cells
	has_one :alignment, as: :alignable, dependent: :destroy

	after_create :create_projections, :create_alignment

	validates_presence_of :block_id

	def rows
		projections.row.order :position
	end

	def cols
		projections.col.order :position
	end

	def has_write_access? user
		block.user == user
	end

	def create_projections
		rows_to_create = rows_count
		cols_to_create = cols_count

		self.rows_count = 0
		self.cols_count = 0

		rows_to_create.times { |index| Projection.create axis:0,table_id:self.id,position:index+1 }
		cols_to_create.times { |index| Projection.create axis:1,table_id:self.id,position:index+1 }
	end

	def cell_at row,col
		cells.where(row_id:row.id,col_id:col.id).take
	end
end