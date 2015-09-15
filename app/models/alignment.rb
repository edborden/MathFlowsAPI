class Alignment < ActiveRecord::Base

	belongs_to :alignable, polymorphic: true
	enum side: [:left,:right,:center]
	validates_presence_of :side

	def has_write_access? user
		alignable.block.user == user
	end

end