class PagesController < ResourceController

	def resource_params
		params.require(:page).permit :test_id
	end

end