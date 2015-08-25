class PreferencesController < ResourceController

	def resource_params
		params.require(:preference).permit :borders,:directions,:tour
	end

end
