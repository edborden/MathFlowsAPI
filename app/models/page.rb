class Page < ActiveRecord::Base
	has_many :child_positions, class_name: "Position", as: :owner, dependent: :destroy
	belongs_to :document
	has_many :positionables, through: :child_positions, source_type: "Block"

	def layout
		document.flow.folder.user.layout
	end

	amoeba do
		enable
	end

end
