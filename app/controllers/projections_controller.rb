class ProjectionsController < ResourceController

	def create
		if_authorized {super}
	end

	def resource_params
		params.require(:projection).permit :size,:axis,:position,:table_id
	end

end
