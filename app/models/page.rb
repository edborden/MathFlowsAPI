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
end
