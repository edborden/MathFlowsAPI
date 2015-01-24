class PagesController < ApplicationController

	def create
		document = Document.find params[:page][:document_id]
		page = Waterfall.new.page
		document.pages<<page
		render json: page.reload
	end

	def show
		page = Page.find params[:id]
		render json: page
	end

	def destroy
		page = Page.find params[:id]
		page.destroy
		head :no_content
	end

end