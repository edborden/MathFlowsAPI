class Page < ActiveRecord::Base
	has_many :child_positions, class_name: "Position", as: :owner
	belongs_to :document

	def self.create_default
		page = Page.create
		position = Position.create_default page
		page.child_positions<<position
		return page
	end
end
