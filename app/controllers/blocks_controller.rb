class BlocksController < ApplicationController

	def create
		page = Page.find params[:block][:page_id]
		position = Position.create position_params
		page.child_positions<<position
		position.create_block block_params
		render json: position.positionable.reload
	end

	def show
		block = Block.find params[:id]
		render json: block
	end

	def update
		block = Block.find params[:id]
		position = block.position
		Position.update position.id,position_params
		position.reload
		render json: block
	end

	def destroy
		block = Block.find params[:id]
		block.position.destroy
		head :no_content
	end

	def block_params
		params.require(:block).permit :question
	end

	def position_params
		params.require(:block).permit :row,:col,:col_span,:row_span
	end

end
