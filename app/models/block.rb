class Block < ActiveRecord::Base

	after_create :starting_snippet

	belongs_to :layout
	has_many :snippets

	def starting_snippet
		snippet = Snippet.new
		snippets<< snippet
	end

	def pdf_row
		self.row - 1
	end

	def pdf_col
		self.col - 1
	end

	def sized?
		has_width? || has_height?
	end

	def has_width?
		self.width > 1
	end

	def has_height?
		self.height > 1
	end

end
