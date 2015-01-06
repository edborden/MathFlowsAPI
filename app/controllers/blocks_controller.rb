class BlocksController < ApplicationController

	def create
		block = Block.create block_params
		render json: block
	end

	def update
		block = Block.update params[:id], block_params
		render json: block
	end

	def destroy
		block = Block.find params[:id]
		block.destroy
		head :no_content
	end

	def block_params
		params.require(:block).permit :row,:col,:height,:width,:layout_id
	end

end
