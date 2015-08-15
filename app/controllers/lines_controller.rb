class LinesController < ResourceController

	def create
		if_authorized {super}
	end

	def resource_params
		params.require(:line).permit :content, :block_id, :position
	end

end
