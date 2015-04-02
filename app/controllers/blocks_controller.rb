class BlocksController < ResourceController

	def resource_params
		params.require(:block).permit :content,:question
	end

end
