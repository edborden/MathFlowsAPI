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

		lines = self.lines.present? ? self.lines : [Line.new]
						
		lines.each do |line|

			y += 5 # top padding

			lines_box = pdf.bounding_box [1,pdf.bounds.top-y],width:pdf.bounds.right do
				line.write_to_pdf pdf
				pdf.move_down 5 #bottom padding
			end

			y += lines_box.height

		end

	end

end