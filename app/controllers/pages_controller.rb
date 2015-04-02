class PagesController < ResourceController

	def create
		document = Document.find params[:page][:document_id]
		page = Waterfall.new.page(MasterMold.new.fresh_page)
		document.pages<<page
		render json: page.reload
	end

end