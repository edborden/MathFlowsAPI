class PositionsController < ApplicationController

	def create
		if params[:position][:page_id]
			page = Page.find params[:position][:page_id]
			position = BlockBuilder.new(page,position_params).position
			position.reload
		else #header position
			position = Waterfall.new.position({params:position_params,block:MasterMold.new.default_block})
		end
		render json: position
	end

	def show #async:true in client block model
		position = Position.find params[:id]
		render json: position
	end

	def update
		position = Position.find params[:id]
		Position.update position.id,position_params
		render json: position.reload
	end

	def position_params
		params.require(:position).permit :row,:col,:col_span,:row_span,:user_id
	end

end
