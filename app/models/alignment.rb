class Alignment < ActiveRecord::Base

	belongs_to :alignable, polymorphic: true
	enum side: [:left,:right]
	validates_presence_of :alignable_id,:alignable_type,:side

	def has_write_access? user
		alignable.block.user == user
	end

end