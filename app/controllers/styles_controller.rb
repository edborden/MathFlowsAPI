class StylesController < ResourceController

	def create
		if_authorized {super}
	end

	def resource_params
		params.require(:style).permit :line_id,:effect
	end

end
