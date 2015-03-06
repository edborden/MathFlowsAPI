class PagesController < ApplicationController

	def create
		document = Document.find params[:page][:document_id]
		page = Waterfall.new.page(MasterMold.new.fresh_page)
		document.pages<<page
		render json: page.reload
	end

	def show
		page = Page.find params[:id]
		render json: page, serializer:PageWithDocumentSerializer, root:'page'
	end

	def destroy
		page = Page.find params[:id]
		page.destroy
		head :no_content
	end

end