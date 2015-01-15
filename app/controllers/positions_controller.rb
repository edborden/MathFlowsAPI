class PositionsController < ApplicationController

	def create
		if params[:position][:page_id]
			source = Page.find(params[:position][:page_id])
		else 
			source = Block.find(params[:position][:block_id])
		end
		position = Position.create_default source
		Position.update position.id,position_params
		source.child_positions<<position
		render json: position.reload
	end

	def update
		position = Position.update params[:id], position_params
		render json: position
	end

	def destroy
		position = Position.find params[:id]
		position.destroy
		head :no_content
	end

	def position_params
		params.require(:position).permit :row,:col,:col_span,:row_span
	end

end
