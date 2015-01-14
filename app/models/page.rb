class Page < ActiveRecord::Base
	has_many :child_positions, class_name: "Position", as: :owner
	belongs_to :document
	has_one :layout

	def self.create_default layout
		page = Page.create
		position = Position.create_default page,layout
		page.child_positions<<position
		return page
	end

	def layout
		try(:document).try(:flow).try(:layout)
	end
end
