class Block < ActiveRecord::Base
	has_many :positions, as: :positionable
	has_many :child_positions, class_name: "Position", as: :owner, dependent: :destroy
	has_many :positionables, through: :child_positions, source_type: "Snippet"

	after_create do
		position = Position.create
		child_positions<<position
		if question
			params = {question_number:true}
		else
			params = {question_number:false}
		end
		position.create_snippet params
	end

	def snippets
		positionables
	end

	def layout
		positions.first.owner.layout
	end

	def width
		positions.first.width
	end

	def height
		positions.first.height
	end

	def col_width
		positions.first.col_width
	end

end
