class Table < ActiveRecord::Base
	include Prawn::View

	belongs_to :block
	has_many :projections, dependent: :destroy
	has_many :cells
	has_one :alignment, as: :alignable, dependent: :destroy

	attr_accessor :rows_count,:cols_count

	after_create :create_alignment, unless: :alignment
	after_create :create_projections

	validates_presence_of :block_position #:block_id

	amoeba do
		enable
		exclude_association :cells
	end

	def width
		@width ||= cols.select(:size).map(&:size).sum
	end

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
		(@rows_count || 0).times { |index| Projection.create axis:0,table_id:self.id,position:index+1 }
		(@cols_count || 0).times { |index| Projection.create axis:1,table_id:self.id,position:index+1 }
	end

	def cell_at row,col
		cells.where(row_id:row.id,col_id:col.id).take
	end

	def height
		write_to_pdf(self).height
	end

	def write_to_pdf pdf
		table_box = pdf.bounding_box( [0,pdf.bounds.top], width: pdf.bounds.right ) do

			y = 0

			rows.each do |row|

				x = 0

				row_box = pdf.bounding_box([0,pdf.bounds.top - y], width: pdf.bounds.right ) do

					cols.each do |col|

						pdf.bounding_box([x,pdf.bounds.top],width:col.size) do

							cell = cell_at(row,col) || Cell.new(row_id:row.id,col_id:col.id)
							cell.write_to_pdf pdf

						end

						x += col.size

					end

				end

				pdf.stroke { pdf.rectangle [0,pdf.bounds.top-y],x,row_box.height }

				y += row_box.height

			end 

		end
			
		#stroke each col
		x = 0
		cols.each do |col|
			x += col.size
			pdf.stroke { pdf.vertical_line pdf.bounds.top, pdf.bounds.top - table_box.height, at: x }
		end
		return table_box
	end
end