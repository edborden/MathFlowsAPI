class PagesController < ApplicationController

	def create
		page = Page.create_default
		doc = Document.find params[:page][:document_id]
		doc.pages<<page
		render json: page.reload
	end

end