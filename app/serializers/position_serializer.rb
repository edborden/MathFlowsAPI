class PositionSerializer < ApplicationSerializer
	attributes :row,:col,:row_span,:col_span

	has_one :block,embed_in_root:true
	has_one :snippet,embed_in_root:true

	def positionable
		@positionable ||= object.try(:positionable)
	end

	def block
		if positionable.is_a? Block
			return positionable
		else
			return nil
		end
	end

	def snippet
		if positionable.is_a? Snippet
			return positionable
		else
			return nil
		end
	end
end