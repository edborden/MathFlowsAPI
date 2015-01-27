class PositionsController < ApplicationController

	def create
		page = Page.find params[:position][:page_id]
		position = BlockBuilder.new(page,position_params,block_params).page_position
		render json: position.reload, serializer: PositionSerializer, root:"position"
	end

	def show #async:true in client block model
		position = Position.find params[:id]
		render json: position
	end

	def update
		position = Position.find params[:id]
		Position.update position.id,position_params
		render json: position.reload, serializer: PositionSerializer, root:"position"
	end

	def position_params
		params.require(:position).permit :row,:col,:col_span,:row_span
	end

	def block_params
		params.require(:position).permit :question
	end

end
