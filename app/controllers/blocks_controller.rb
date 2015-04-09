class BlocksController < ResourceController

	def resource_params
		params.require(:block).permit :content,:question,:row,:col,:col_span,:row_span,:user_id,:page_id,:test_id
	end

end
