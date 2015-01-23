class Page < ActiveRecord::Base
	has_many :child_positions, class_name: "Position", as: :owner, dependent: :destroy
	belongs_to :document
	has_many :positionables, through: :child_positions, source_type: "Block"

	after_create do
		position = Position.create
		child_positions<<position
		position.create_block
	end

	def layout
		try(:document).try(:flow).try(:layout)
	end

	def question_blocks
		positionables.where(question:true)
	end

	def question_positions
		question_positions = []
		question_blocks.each do |block|
			question_positions.push(block.position)
		end
		question_positions.sort_by! {|x| [x.row, x.col] }
	end

end
