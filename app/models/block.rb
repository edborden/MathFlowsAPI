class Block < ActiveRecord::Base
	has_many :positions, as: :positionable, dependent: :destroy
	has_many :child_positions, class_name: "Position", as: :owner, dependent: :destroy
	has_many :positionables, through: :child_positions, source_type: "Snippet"
end
