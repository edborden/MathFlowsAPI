class LinesController < ResourceController

	def resource_params
		params.require(:line).permit :content, :block_id
	end

	def update
		if @resource.update resource_params
			Invalidator.new(@resource.block).run
			render_resource
		else
			render_errors
		end		
	end

end
