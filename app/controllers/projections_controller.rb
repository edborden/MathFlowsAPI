class ProjectionsController < ResourceController

	def resource_params
		params.require(:projection).permit :size
	end

end
