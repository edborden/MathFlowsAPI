class PositionsController < ApplicationController

	def create
		page = Page.find params[:position][:page_id]
		position = Waterfall.new.block_position position_params,block_params
		page.child_positions<<position
		render json: position.reload
	end

	def update
		position = Position.find params[:id]
		Position.update position.id,position_params
		render json: position.reload
	end

	def position_params
		params.require(:position).permit :row,:col,:col_span,:row_span
	end

	def block_params
		params.require(:position).permit :question
	end

end
