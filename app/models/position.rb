class Position < ActiveRecord::Base
	belongs_to :owner, polymorphic:true
	belongs_to :positionable, polymorphic:true

	def self.create_default source,layout=nil
		position = Position.create
		if source.is_a? Page
			Block.create_default position,layout
		end
		if source.is_a? Block
			Snippet.create_default position
		end
		return position
	end
end
