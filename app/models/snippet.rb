class Snippet < ActiveRecord::Base
	has_one :equation
	has_one :image, as: :imageable
	has_one :position, as: :positionable

	def self.create_default position
		snippet = Snippet.new
		snippet.position = position
		snippet.save
		return snippet
	end
end
