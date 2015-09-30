class Cell < ActiveRecord::Base

	belongs_to :table
	belongs_to :row, class_name:"Projection", inverse_of: :row_cells
	belongs_to :col, class_name:"Projection", inverse_of: :col_cells
	has_many :lines, -> { order(:position) }, as: :lineable, dependent: :destroy

	validates_presence_of :row_id,:col_id

	amoeba {enable}

	def user
		table.block.user
	end

	def has_write_access? user
		self.user == user
	end

	def write_to_pdf pdf
		y = 0
						
		lines.each do |line|

			lines_box = pdf.bounding_box [0,pdf.bounds.top-y],width:pdf.bounds.right do

				line.write_to_pdf pdf

			end

			y += lines_box.height

		end

	end

end