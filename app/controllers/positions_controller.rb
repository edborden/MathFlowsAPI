class PositionsController < ResourceController

	def create
		if params[:position][:page_id]
			page = Page.find params[:position][:page_id]
			position = BlockBuilder.new(page,resource_params).position
			position.reload
		else #header position
			position = Waterfall.new.position({params:resource_params,block:MasterMold.new.default_block})
		end
		render json: position
	end

	# show:  async:true in client block model

	def resource_params
		params.require(:position).permit :row,:col,:col_span,:row_span,:user_id
	end

end
