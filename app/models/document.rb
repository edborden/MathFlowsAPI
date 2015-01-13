class Document < ActiveRecord::Base
	has_many :pages
	belongs_to :flow

	def self.create_default
		document = Document.create
		page = Page.create_default
		document.pages<<page
		return document
	end
end
