class Block < ActiveRecord::Base

	after_create :starting_snippet

	belongs_to :layout
	has_many :snippets

	def starting_snippet
		snippet = Snippet.new
		snippets<< snippet
	end

end
