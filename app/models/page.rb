class Page < ActiveRecord::Base
	has_many :child_positions, class_name: "Position", as: :owner, dependent: :destroy
	belongs_to :document
	has_one :layout
	has_many :positionables, through: :child_positions, source_type: "Block"

	def self.create_default
		page = Page.create
		position = Position.create_default page
		page.child_positions<<position
		return page
	end

	def layout
		try(:document).try(:flow).try(:layout)
	end
end
