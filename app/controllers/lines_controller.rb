class LinesController < ResourceController

	def resource_params
		params.require(:line).permit :content, :block_id, :position
	end

end
