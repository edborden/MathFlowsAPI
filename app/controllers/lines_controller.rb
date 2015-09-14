class LinesController < ResourceController

	def create
		new_resource.lineable_id = params[:line][:block_id]
		resource.lineable_type = "Block"
		if_authorized {super}
	end

	def resource_params
		params.require(:line).permit :content, :position
	end

end
