class PagesController < ResourceController

	def create
		document = Test.find params[:page][:test_id]
		page = Waterfall.new.page(MasterMold.new.fresh_page)
		document.pages<<page
		render json: page.reload
	end

end