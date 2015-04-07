class BlocksController < ResourceController

	# show:  async:true in client block model

	def resource_params
		params.require(:block).permit :content,:question,:row,:col,:col_span,:row_span,:user_id,:page_id
	end

end
