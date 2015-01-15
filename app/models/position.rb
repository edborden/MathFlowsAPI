class Position < ActiveRecord::Base
	belongs_to :owner, polymorphic:true
	belongs_to :positionable, polymorphic:true

	def self.create_default source
		position = Position.new
		if source.is_a? Page
			position.save
			Block.create_default position
		end
		if source.is_a? Block
			position.row = 1
			position.col = 1
			position.save
			Snippet.create_default position
		end
		return position
	end

end
