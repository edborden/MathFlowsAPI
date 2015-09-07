class AlignmentsController < ResourceController

	def resource_params
		params.require(:alignment).permit :side
	end

end
