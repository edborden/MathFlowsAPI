class Line < ActiveRecord::Base
	include ProcessedContent

	belongs_to :lineable, polymorphic: true
	#validates_presence_of :lineable #breaks block.amoeba copy

	def has_write_access? user
		lineable.user == user
	end

end