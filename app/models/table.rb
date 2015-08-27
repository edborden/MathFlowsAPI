class Table < ActiveRecord::Base

	belongs_to :block
	has_many :projections, dependent: :destroy
	has_many :cells

	after_create :create_projections

	validates_presence_of :block_id

	def rows
		projections.row
	end

	def cols
		projections.col
	end

	def has_write_access? user
		block.user == user
	end

	def create_projections
		rows_to_create = rows_count
		cols_to_create = cols_count

		self.rows_count = 0
		self.cols_count = 0

		rows_to_create.times { |index| Projection.create axis:0,table_id:self.id,position:index }
		cols_to_create.times { |index| Projection.create axis:1,table_id:self.id,position:index }
	end
end